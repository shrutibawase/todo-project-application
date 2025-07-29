// Data source for frontend subnet details
data "azurerm_subnet" "frontendsubnetdata" {
  name                 = var.f_subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.nic_resource_group
}

# Data source for backend subnet details (currently commented out)
# data "azurerm_subnet" "backendsubnetdata" {
#   name                 = var.b_subnet_name
#   virtual_network_name = var.virtual_network_name
#   resource_group_name  = var.nic_resource_group
# }

// Data source for existing Public IP
data "azurerm_public_ip" "pipdata" {
  name                = var.name_of_public_ip
  resource_group_name = var.nic_resource_group
}

// Data source for Key Vault secret: VM admin username
data "azurerm_key_vault_secret" "username_kv" {
  name         = "vm-username" // Replace with your secret name for username
  key_vault_id = data.azurerm_key_vault.your_kv.id
}

// Data source for Key Vault secret: VM admin password
data "azurerm_key_vault_secret" "password_kv" {
  name         = "vm-Password"
  key_vault_id = data.azurerm_key_vault.your_kv.id
}

// Data source for Azure Key Vault instance
data "azurerm_key_vault" "your_kv" {
  name                = "lockerkeyvault"        // Name of the Key Vault in Azure portal
  resource_group_name = var.key_vault_resource_group           // Resource group of the Key Vault
}


