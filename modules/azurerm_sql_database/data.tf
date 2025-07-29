data "azurerm_mssql_server" "sqlserver" {
  name                = var.mysql_server_name
  resource_group_name = var.resource_group_name
}