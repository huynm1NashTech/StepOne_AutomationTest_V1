resource "azurerm_mssql_server" "azuredb_server" {
  name                         = "azuredb-ia137-${var.environment}"
  resource_group_name          = var.resource_group_name
  location                     = var.azure_location
  version                      = "12.0"
  administrator_login          = var.db_username
  administrator_login_password = var.db_password
  tags                         = var.common_tags
}

resource "azurerm_mssql_firewall_rule" "fw_rule" {
  name             = "FirewallRule1"
  server_id        = azurerm_mssql_server.azuredb_server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"

  depends_on = [
    azurerm_mssql_server.azuredb_server
  ]
}

resource "azurerm_mssql_firewall_rule" "fw_rule_my_ip" {
  name             = "FirewallRule2"
  server_id        = azurerm_mssql_server.azuredb_server.id
  start_ip_address = "113.22.221.209"
  end_ip_address   = "113.22.221.209"

  depends_on = [
    azurerm_mssql_server.azuredb_server
  ]
}


resource "azurerm_mssql_database" "sqlserver_db" {
  name           = "config_audit"
  server_id      = azurerm_mssql_server.azuredb_server.id
  zone_redundant = false
  sku_name       = var.sku_name

  depends_on = [
    azurerm_mssql_firewall_rule.fw_rule
  ]

  tags = var.common_tags
}
