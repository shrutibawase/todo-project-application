// Variables for Network Interface configuration
variable "nic_name" {
  description = "The name of the network interface"
  type        = string
}

variable "nic_location" {
  description = "The location of the network interface"
  type        = string
}

variable "nic_resource_group" {
  description = "The resource group of the network interface"
  type        = string
}

// Variables for Network Interface configuration (commented out as not used in current code)

# variable "pip_id" {
#   description = "The ID of the public IP address associated with the network interface"
#   type        = string
# }
# variable "nic_subnet_id" {
#   description = "The ID of the subnet for the network interface"
#   type        = string
# }

// Variables for subnet data block
variable "f_subnet_name" {
  description = "The name of the frontend subnet"
  type        = string
}

# variable "b_subnet_name" {
#   description = "The name of the backend subnet"
#   type        = string
# }

variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}

// Variables for public IP data block
variable "name_of_public_ip" {
  description = "The name of the public IP address"
  type        = string
}

// Variables for Virtual Machine configuration
variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "vm_resource_group_name" {
  description = "The name of the resource group for the virtual machine"
  type        = string
}

variable "vm_location" {
  description = "The location of the virtual machine"
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
  default     = "Standard_DS1_v2"
}

# variable "vm_admin_username" {
#   description = "The admin username for the virtual machine"
#   type        = string
# }
# variable "vm_admin_password" {
#   description = "The admin password for the virtual machine"
#   type        = string
#   sensitive   = true // Sensitive information, should not be logged or displayed
# }

// Variables for Key Vault data block to fetch username & password
variable "key_vault_name" {
  description = "Key Vault name"
  type        = string
}

variable "key_vault_resource_group" {
  description = "Resource group of Key Vault"
  type        = string
}

variable "secret_username" {
  description = "Name of the Key Vault secret for the username"
  type        = string
}

variable "secret_pass" {
  description = "Name of the Key Vault secret for the password"
  type        = string
}

// Variables for VM image configuration
variable "image_publisher" {
  description = "The publisher of the image for the virtual machine"
  type        = string
}

variable "image_offer" {
  description = "The offer of the image for the virtual machine"
  type        = string
}

variable "image_sku" {
  description = "The SKU of the image for the virtual machine"
  type        = string  
}

variable "image_version" {
  description = "The version of the image for the virtual machine"
  type        = string
  default     = "latest"
  
}