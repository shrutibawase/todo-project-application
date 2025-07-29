variable "nic_name" {
  description = "The name of the network interface"
  type        = string

}
variable "nic_location" {
  description = "The name of the network interface"
  type        = string
}
variable "nic_resource_group" {
  description = "The name of the network interface"
  type        = string
}

//no need of id 

# variable "pip_id" {
#   description = "The ID of the public IP address associated with the network interface"
#   type        = string
  
# }
# variable "nic_subnet_id" {
#   description = "The ID of the subnet for the network interface"
#   type        = string

# }

//data block ke variable for subnet 
variable "f_subnet_name" {
  description = "The name of the subnet"
  type        = string
  
}
# variable "b_subnet_name" {
#   description = "The name of the subnet"
#   type        = string
  
# }
variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
  
}

//data block ke variable for public ip
variable "name_of_public_ip" {
  description = "The name of the public IP address"
  type        = string
  
}

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
#   }
# variable "vm_admin_password" {
#   description = "The admin password for the virtual machine"
#   type        = string
#   sensitive   = true // Sensitive information, should not be logged or displayed
# }

//data block se keyvault through username & password value fetch kare ge
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