resource "azurerm_storage_account" "storage" {
  name                     = "storageia137${var.environment}"
  resource_group_name      = var.resource_group_name
  location                 = var.azure_location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = true

  tags = var.common_tags
}
