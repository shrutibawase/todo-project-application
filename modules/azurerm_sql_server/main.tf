resource "azurerm_mssql_server" "example" {
  name                         = var.sqlserver_name
  resource_group_name          = var.resource_group_name
  location                     = var.sql_sever_location
  version                      = var.sql_server_version
  administrator_login          = var.sql_server_administrator_login
  administrator_login_password = var.sql_server_adm_login_pass
}
