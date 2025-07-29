# Terraform configuration for creating an Azure Virtual Machine with a Network Interface and Public IP

// Network Interface Card (NIC) resource
resource "azurerm_network_interface" "example" {
  name                = var.nic_name
  location            = var.nic_location
  resource_group_name = var.nic_resource_group

  ip_configuration {
    public_ip_address_id           = data.azurerm_public_ip.pipdata.id // Reference to existing Public IP
    name                           = "internal"
    // Fetch subnet ID from existing Azure subnet data source 
    subnet_id                      = data.azurerm_subnet.frontendsubnetdata.id
    private_ip_address_allocation  = "Dynamic" // Dynamic private IP allocation 
  }
}

// Virtual Machine resource
resource "azurerm_linux_virtual_machine" "examplevm" {
  name                            = var.vm_name
  resource_group_name             = var.vm_resource_group_name
  location                        = var.vm_location
  size                            = var.vm_size
  disable_password_authentication = false // Set to true if using SSH keys instead of password
  admin_username                  = data.azurerm_key_vault_secret.username_kv.value // Fetch username from Key Vault
  admin_password                  = data.azurerm_key_vault_secret.password_kv.value // Fetch password from Key Vault

  // Attach NIC to VM (implicit dependency)
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  // Specify the image to use for the VM
  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  // Custom data script to install and start Nginx on the VM
  custom_data = base64encode(<<EOF
#!/bin/bash
apt-get update
apt-get install -y nginx
systemctl enable nginx
systemctl start nginx
EOF
  )
}

