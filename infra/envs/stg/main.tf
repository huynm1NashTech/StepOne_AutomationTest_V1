terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.13.0"
    }
    databricks = {
      source = "databricks/databricks"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
  skip_provider_registration = true
}


module "storage-account" {
  source              = "../../modules/storage"
  environment         = var.app_env
  azure_location      = var.azure_location
  resource_group_name = var.resource_group_name
  common_tags         = var.common_tags
}

module "data-lake" {
  source               = "../../modules/lake"
  environment          = var.app_env
  azure_location       = var.azure_location
  resource_group_name  = var.resource_group_name
  common_tags          = var.common_tags
  storage_account_name = local.storage_account_name

  depends_on = [
    module.storage-account,
  ]
}


module "key-vault" {
  source                        = "../../modules/vault"
  environment                   = var.app_env
  azure_location                = var.azure_location
  resource_group_name           = var.resource_group_name
  common_tags                   = var.common_tags
  storage_account               = local.storage_account_name
  on-premise-password           = var.on-premise-password
  azuresql_connection_string    = local.azuresql_connection_string
  localdbconn_connection_string = local.localdbconn_connection_string
  clouddbconn_connection_string = var.clouddbconn_connection_string

  depends_on = [
    module.storage-account,
  ]
  
}


module "pipeline-parameter-db" {
  source              = "../../modules/sqlserver"
  environment         = var.app_env
  azure_location      = var.azure_location
  resource_group_name = var.resource_group_name
  db_username         = var.db_username
  db_password         = var.db_password
  sku_name            = var.sku_name
  common_tags         = var.common_tags

  depends_on = [
    module.storage-account,
    module.data-lake,
    module.key-vault,
  ]
}

module "synapse-workspace" {
  source                           = "../../modules/synapse"
  environment                      = var.app_env
  azure_location                   = var.azure_location
  resource_group_name              = var.resource_group_name
  sql_administrator_login          = var.sql_administrator_login
  sql_administrator_login_password = var.sql_administrator_login_password
  keyvault_name                    = local.keyvault_name

  storage_account_name = local.storage_account_name
  connection_app_principle_id = var.connection_app_principle_id

  spark_version                    = var.spark_version
  synapse_spark_pool_node_size     = var.synapse_spark_pool_node_size
  synapse_delay_in_minutes         = var.synapse_delay_in_minutes
  synapse_autoscale_max_node_count = var.synapse_autoscale_max_node_count
  synapse_autoscale_min_node_count = var.synapse_autoscale_min_node_count
  synapse_sql_pool_sku_name        = var.synapse_sql_pool_sku_name

  common_tags     = var.common_tags

  depends_on = [
    module.storage-account,
    module.data-lake,
    module.pipeline-parameter-db,
    module.key-vault,
  ]
}


