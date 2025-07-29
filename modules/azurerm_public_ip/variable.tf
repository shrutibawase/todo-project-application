variable "public_ip_name" {
  description = "The name of the public IP"
  type        = string
  
}

variable "resource_group_pip" {
  description = "The name of the resource group for the public IP"
  type        = string
  
}

variable "location_pip" {
  description = "The location of the public IP"
  type        = string
  
}

variable "allocation_method_pip" {
  description = "The allocation method for the public IP"
  type        = string
  default     = "Static"
  
}