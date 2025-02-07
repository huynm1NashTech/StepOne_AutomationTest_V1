data "azurerm_client_config" "current" {}

data "azurerm_storage_account" "rg_storage_account" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}


resource "azurerm_synapse_workspace" "synapse" {
  name                = "synapse-ia137-${var.environment}"
  location            = var.azure_location
  resource_group_name = var.resource_group_name

  storage_data_lake_gen2_filesystem_id = "${data.azurerm_storage_account.rg_storage_account.primary_dfs_endpoint}lake"
  sql_administrator_login              = var.sql_administrator_login
  sql_administrator_login_password     = var.sql_administrator_login_password

  identity {
    type = "SystemAssigned"
  }

  tags = var.common_tags
}

resource "azurerm_synapse_firewall_rule" "rg_fw-azure-services" {
  name                 = "AllowAllWindowsAzureIps"
  synapse_workspace_id = azurerm_synapse_workspace.synapse.id
  start_ip_address     = "0.0.0.0"
  end_ip_address       = "0.0.0.0"

  depends_on = [
    azurerm_synapse_workspace.synapse
  ]
}

resource "azurerm_synapse_firewall_rule" "rg_fw" {
  name                 = "AllowAllMyIp"
  synapse_workspace_id = azurerm_synapse_workspace.synapse.id
  start_ip_address     = "113.22.221.209"
  end_ip_address       = "113.22.221.209"

  depends_on = [
    azurerm_synapse_workspace.synapse
  ]
}

resource "azurerm_synapse_spark_pool" "spark_pool" {
  name                 = "mainpool"
  synapse_workspace_id = azurerm_synapse_workspace.synapse.id
  node_size_family     = "MemoryOptimized"
  node_size            = var.synapse_spark_pool_node_size
  spark_version        = var.spark_version

  auto_scale {
    max_node_count = var.synapse_autoscale_max_node_count
    min_node_count = var.synapse_autoscale_min_node_count
  }

  auto_pause {
    delay_in_minutes = var.synapse_delay_in_minutes
  }

  tags = var.common_tags

  depends_on = [
    azurerm_synapse_firewall_rule.rg_fw
  ]
}


# resource "azurerm_synapse_sql_pool" "sqlpool" {
#   name                 = "mainsqlpool"
#   synapse_workspace_id = azurerm_synapse_workspace.synapse.id
#   sku_name             = var.synapse_sql_pool_sku_name
#   create_mode          = "Default"
# }


# resource "azurerm_synapse_role_assignment" "rg-role" {
#   synapse_workspace_id = azurerm_synapse_workspace.synapse.id
#   role_name            = "Synapse Administrator"
#   principal_id         = var.connection_app_principle_id
#
#   depends_on = [
#     azurerm_synapse_spark_pool.spark_pool
#   ]
# }

resource "azurerm_role_assignment" "blob-contributor-role" {
  scope                = data.azurerm_storage_account.rg_storage_account.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_synapse_workspace.synapse.identity[0].principal_id
}

data "azurerm_key_vault" "keyvault" {
  name                = var.keyvault_name
  resource_group_name = var.resource_group_name
}

// Assign access to synapse workspace
resource "azurerm_key_vault_access_policy" "synpase-policy" {
  key_vault_id = data.azurerm_key_vault.keyvault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_synapse_workspace.synapse.identity[0].principal_id

  key_permissions = [
    "Get",
    "List"
  ]

  secret_permissions = [
    "Get",
    "List"
  ]

  depends_on = [
    azurerm_synapse_workspace.synapse
  ]
}
