data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "vault" {
  name                        = "vault-ia137-${var.environment}"
  location                    = var.azure_location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  purge_protection_enabled    = false
  tenant_id                   = data.azurerm_client_config.current.tenant_id

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
      "List",
      "Delete",
      "Recover",
      "Import",
      "Decrypt",
      "Sign",
      "Update",
      "Purge"

    ]

    secret_permissions = [
      "Set",
      "Get",
      "List",
      "Delete",
      "Recover",
      "Purge"
    ]
  }

  tags = var.common_tags
}

# Print the URL to the databrickes workspace.
output "keyvault_id" {
  value       = azurerm_key_vault.vault.id
}
output "keyvault_uri" {
  value       = azurerm_key_vault.vault.vault_uri
}

 //Add Databricks
// Create access key for on-premise computer
resource "azurerm_key_vault_secret" "nt-on-premise-password" {
  name         = "on-premise-login-password"
  value        = var.on-premise-password
  key_vault_id = azurerm_key_vault.vault.id
  tags         = var.common_tags
}

// Create access key for storage account
data "azurerm_storage_account" "storage_account" {
  name                = var.storage_account
  resource_group_name = var.resource_group_name
}

resource "azurerm_key_vault_secret" "storage_account_key" {
  name         = "datalakeconn"
  value        = data.azurerm_storage_account.storage_account.primary_access_key
  key_vault_id = azurerm_key_vault.vault.id
  tags         = var.common_tags
}

// Access key for pipeline parameter database
resource "azurerm_key_vault_secret" "azuresql" {
  name         = "azuresql"
  value        = var.azuresql_connection_string
  key_vault_id = azurerm_key_vault.vault.id
  tags         = var.common_tags
}

// Access key for sample sale database
resource "azurerm_key_vault_secret" "clouddbconn" {
  name         = "clouddbconn"
  value        = var.clouddbconn_connection_string
  key_vault_id = azurerm_key_vault.vault.id
  tags         = var.common_tags
}

// Access key for local source database
resource "azurerm_key_vault_secret" "localdbconn" {
  name         = "localdbconn"
  value        = var.localdbconn_connection_string
  key_vault_id = azurerm_key_vault.vault.id
  tags         = var.common_tags
}



