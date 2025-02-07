data "azurerm_storage_account" "rg" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_storage_data_lake_gen2_filesystem" "rg" {
  name                  = "lake"
  storage_account_id    = data.azurerm_storage_account.rg.id
}
