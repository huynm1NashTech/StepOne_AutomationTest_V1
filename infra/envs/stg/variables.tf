// Resource group name
variable "resource_group_name" {
  default = "DataPractice"
}

// Default Resource location
variable "azure_location" {
  default = "East Asia"
}

// App environment prefix
variable "app_env" {
  default = "stg"
}


variable "common_tags" {
  type = map(string)
  default = {
    APP     = "StepOne_AutomationTest_V1"
    ENV     = "STG"
    PROJECT = "StepOne_AutomationTest_V1"
  }
}


// Database edition or sku name
variable "sku_name" {
  default = "Basic"
}
// On-premise login user password
// This password will be stored on the Azure Keyvault
// Config this variable in crendentials.auto.tfvars file
variable "on-premise-password" {
  sensitive = true
}

// connection string to the sample tikit database
// update this value in the crendentials.auto.tfvars files
variable "clouddbconn_connection_string" {
  sensitive = true
}
// Azure DevOps connection app service principle ID
variable "connection_app_principle_id" {
  default = "4fd5535c-d65d-4c4c-8e59-aabfe1d7099b"
}

// User name of the pipeline parameters DB
// This username will be use to create SQL Server database for storing
// update this value in the crendentials.auto.tfvars files
variable "db_username" {
  sensitive = true
}

// Password of the pipeline parameters DB
// This password will be use to create and access SQL Server database for storing
// update this value in the crendentials.auto.tfvars files
variable "db_password" {
  sensitive = true
}


// Synapse workspace section
// The built-in Synapse workspace serverless SQL pool username
// update this value in the crendentials.auto.tfvars files
variable "sql_administrator_login" {
  sensitive = true
}

// The built-in Synapse workspace serverless SQL pool password
// update this value in the crendentials.auto.tfvars files
variable "sql_administrator_login_password" {
  sensitive = true
}

// spark version to pervision sparkpool
variable "spark_version" {
  default = 3.1
}

// Node size for sparkpool
variable "synapse_spark_pool_node_size" {
  default = "Small"
}

// Sparkpool auto pause after minutes
variable "synapse_delay_in_minutes" {
  default = 5
}

// Minimun number of sparkpool node when scale down
variable "synapse_autoscale_min_node_count" {
  default = 3
}

// Maximun number of sparkpool node when scale up
variable "synapse_autoscale_max_node_count" {
  default = 4
}

// synapse SQL data warehouse pool
variable "synapse_sql_pool_sku_name" {
  default = "DW100c"
}

//For databricks
variable "resource_prefix" {
  default = "ia137"
}


locals {
  // Storage account
  storage_account_name = "storageia137${var.app_env}"

  // ADF name
  adf_name = "adf-ia137-${var.app_env}"
  // Synapse name
  synapse_name = "synapse-ia137-${var.app_env}"

  // DB connection string of the pipeline parameters
  azuresql_connection_string = "Server=tcp:azuredb-ia137-${var.app_env}.database.windows.net,1433;Initial Catalog=config_audit;Persist Security Info=False;User ID=${var.db_username};Password=${var.db_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"

  // local database source connection string
  localdbconn_connection_string = "Data Source=localhost,1433;Network Library=DBMSSOCN;Initial Catalog=tickit;User ID=sa;Password=${var.on-premise-password};"

  // name of the main keyvault
  keyvault_name = "vault-ia137-${var.app_env}"

}
