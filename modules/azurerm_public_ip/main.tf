resource "azurerm_public_ip" "example" {
  # name                = "todo-app-PublicIp1"
  # resource_group_name = "rg-todo-app"
  # location            = "East US"
  # allocation_method   = "Static"

  name                = var.public_ip_name
  resource_group_name = var.resource_group_pip
  location            = var.location_pip
  allocation_method   = var.allocation_method_pip
}