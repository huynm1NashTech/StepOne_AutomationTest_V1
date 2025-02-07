variable "environment" {}

variable "azure_location" {}

variable "resource_group_name" {}

variable "common_tags" {}

variable "storage_account_name" {}

// The built-in serverless SQL pool username
variable "sql_administrator_login" {}

// The built-in serverless SQL pool password
variable "sql_administrator_login_password" {}

// Azure devops connection App principle ID
variable "connection_app_principle_id" {}

// spark version to pervision sparkpool
variable "spark_version" {}

// Node size for sparkpool
variable "synapse_spark_pool_node_size" {}

// Sparkpool auto pause after minutes
variable "synapse_delay_in_minutes" {}

// Maximun number of sparkpool node when scale up
variable "synapse_autoscale_max_node_count" {}

// Minimun number of sparkpool node when scale down
variable "synapse_autoscale_min_node_count" {}

variable "synapse_sql_pool_sku_name" {}

variable "keyvault_name" {}
