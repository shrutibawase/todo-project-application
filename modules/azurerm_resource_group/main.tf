
resource "azurerm_resource_group" "rgex" {
  name = var.resource_group_name
  location = var.resource_group_location
}