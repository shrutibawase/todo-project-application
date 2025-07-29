variable "virtual_network_name" {
  description = "values for azurerm_virtual_network"
  type = string
}
variable "virtual_network_loaction" {
  description = "The location of the virtual network"
  type = string
  
}
variable "virtual_network_resource_group_name" {
  description = "The name of the resource group for the virtual network"
  type = string 
  
}
variable "virtual_network_address_space" {
  description = "The address space for the virtual network"
  type = list(string)
  
}
variable "virtual_network_dns_servers" {
  description = "The DNS servers for the virtual network"
  type = list(string)
  default = []
  
}