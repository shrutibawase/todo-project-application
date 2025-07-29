//data block 
data "azurerm_subnet" "frontendsubnetdata" {
  name                 = var.f_subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.nic_resource_group
}

# data "azurerm_subnet" "backendsubnetdata" {
#   name                 = var.b_subnet_name
#   virtual_network_name = var.virtual_network_name
#   resource_group_name  = var.nic_resource_group
# }


data "azurerm_public_ip" "pipdata" {
  name                = var.name_of_public_ip
  resource_group_name = var.nic_resource_group
}

//block for key vault username and password
data "azurerm_key_vault_secret" "username_kv" {
  name         = "vm-username" // Replace with your secret name for username
  key_vault_id = data.azurerm_key_vault.your_kv.id
}

data "azurerm_key_vault_secret" "password_kv" {
  name         = "vm-Password"
  key_vault_id = data.azurerm_key_vault.your_kv.id
}

data "azurerm_key_vault" "your_kv" {
  name                = "lockerkeyvault"        // Azure portal se Key Vault ka naam
  resource_group_name = var.key_vault_resource_group           // Key Vault ka resource group
}


