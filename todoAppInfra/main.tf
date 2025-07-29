module "resource_group" {
  source                  = "../modules/azurerm_resource_group"
  resource_group_name     = "rg-todo-app"
  resource_group_location = "Central India"
}

module "virtual_network" {
  depends_on                          = [module.resource_group]
  source                              = "../modules/azurerm_virtual_network"
  virtual_network_name                = "vnet-todo-app"
  virtual_network_loaction            = "Central India"
  virtual_network_resource_group_name = "rg-todo-app"
  virtual_network_address_space       = ["10.0.0.0/16"]
  virtual_network_dns_servers         = ["10.0.1.4", "10.0.2.4"]
}

module "frontend_subnet" {
  depends_on                  = [module.virtual_network]
  source                      = "../modules/azurerm_subnet"
  subnet_name                 = "frontend-subnet"
  subnet_resource_group_name  = "rg-todo-app"
  subnet_virtual_network_name = "vnet-todo-app"
  subnet_address_prefixes     = ["10.0.1.0/24"]
}

module "backend_subnet" {
  depends_on                  = [module.virtual_network]
  source                      = "../modules/azurerm_subnet"
  subnet_name                 = "backend-subnet"
  subnet_resource_group_name  = "rg-todo-app"
  subnet_virtual_network_name = "vnet-todo-app"
  subnet_address_prefixes     = ["10.0.2.0/24"]
}

module "public_ip_frontend" {
  source                = "../modules/azurerm_public_ip"
  public_ip_name        = "todo-app-PublicIp3"
  resource_group_pip    = "rg-todo-app"
  location_pip          = "Central India"
  allocation_method_pip = "Static"
}

module "public_ip_backend" {
  source                = "../modules/azurerm_public_ip"
  public_ip_name        = "todo-app-PublicIp4"
  resource_group_pip    = "rg-todo-app"
  location_pip          = "Central India"
  allocation_method_pip = "Static"
}

module "frontend_nic_and_vm" {
  depends_on = [module.frontend_subnet]
  source     = "../modules/azurerm_vitual_machine"

  nic_name           = "todo-app-nic"
  nic_resource_group = "rg-todo-app"
  nic_location       = "Central India"

  //hardcode values for pip_id and nic_subnet_id

  # pip_id = "/subscriptions/193a80b5-b916-4c17-b06d-cfc310d07a2c/resourceGroups/rg-todo-app/providers/Microsoft.Network/publicIPAddresses/todo-app-PublicIp3"
  # nic_subnet_id = "/subscriptions/193a80b5-b916-4c17-b06d-cfc310d07a2c/resourceGroups/rg-todo-app/providers/Microsoft.Network/virtualNetworks/vnet-todo-app/subnets/frontend-subnet"

  //data block for pip_id and subnet_id - 
  virtual_network_name = "vnet-todo-app"
  f_subnet_name        = "frontend-subnet"
  name_of_public_ip    = "todo-app-PublicIp3"

  vm_name                = "todo-app-vm"
  vm_resource_group_name = "rg-todo-app"
  vm_location            = "Central India"
  vm_size                = "Standard_B1s"
  # vm_admin_username      = "azureuser"
  # vm_admin_password      = "P@ssw0rd123"

  //data block for keyvault username and password
   key_vault_name            = "lockerkeyvault"
  key_vault_resource_group  = "rg-todo-app"
  secret_username           = "vm-username"
  secret_pass               = "vm-Password"


  image_publisher = "Canonical"
  image_offer     = "0001-com-ubuntu-server-jammy"
  image_sku       = "22_04-lts"
  image_version   = "latest"

}

# module "backend_nic_and_vm" {
#   depends_on = [module.backend_subnet]
#   source     = "../modules/azurerm_vitual_machine"

#   nic_name           = "todo-app-nic_backend"
#   nic_resource_group = "rg-todo-app"
#   nic_location       = "Central India"

#   //hardcoded values for pip_id and nic_subnet_id

#   pip_id = "/subscriptions/193a80b5-b916-4c17-b06d-cfc310d07a2c/resourceGroups/rg-todo-app/providers/Microsoft.Network/publicIPAddresses/todo-app-PublicIp4"
#   nic_subnet_id = "/subscriptions/193a80b5-b916-4c17-b06d-cfc310d07a2c/resourceGroups/rg-todo-app/providers/Microsoft.Network/virtualNetworks/vnet-todo-app/subnets/backend-subnet"

#   # virtual_network_name = "vnet-todo-app"
#   # f_subnet_name        = "backend-subnet"
#   # name_of_public_ip    = "todo-app-PublicIp4"

#   vm_name                = "todo-app-vmbackend"
#   vm_resource_group_name = "rg-todo-app"
#   vm_location            = "Central India"
#   vm_size                = "Standard_B1s"
#   vm_admin_username      = "azureuser"
#   vm_admin_password      = "P@ssw0rd123"

#   image_publisher = "Canonical"
#   image_offer     = "0001-com-ubuntu-server-jammy"
#   image_sku       = "22_04-lts"
#   image_version   = "latest"

# }

module "sql_server" {
  source = "../modules/azurerm_sql_server"

  sqlserver_name                 = "mssqlservertodoapp"
  resource_group_name            = "rg-todo-app"
  sql_sever_location             = "Central India"
  sql_server_version             = "12.0"
  sql_server_administrator_login = " missadministrator"
  administrator_login_password   = "  thisIsKat11"
  sql_server_adm_login_pass      = " thisIsKat@11"

}

module "mysql_database" {
  source     = "../modules/azurerm_sql_database"
  depends_on = [module.sql_server]

  mysql_database_name = "tododb"
  mysql_server_name     = "mssqlservertodoapp"
  resource_group_name = "rg-todo-app"
}

