# Terraform configuration for creating an Azure Virtual Machine with a Network Interface and Public IP

//NIC
resource "azurerm_network_interface" "example" {
  name                = var.nic_name
  location            = var.nic_location
  resource_group_name = var.nic_resource_group

  ip_configuration {
    public_ip_address_id = data.azurerm_public_ip.pipdata.id
    name                 = "internal"
    //azure portal pe bane huye id fetch krna hai 
    subnet_id                     = data.azurerm_subnet.frontendsubnetdata.id
    private_ip_address_allocation = "Dynamic"
  }
}

// Virtual Machine
resource "azurerm_linux_virtual_machine" "examplevm" {
  name                            = var.vm_name
  resource_group_name             = var.vm_resource_group_name
  location                        = var.vm_location
  size                            = var.vm_size
  disable_password_authentication = false                                           // Set to true if using SSH keys instead of password
  admin_username                  = data.azurerm_key_vault_secret.username_kv.value // Fetch username from Key Vault
  admin_password                  = data.azurerm_key_vault_secret.password_kv.value // Use a secure password or consider using SSH keys

  //username or password use karke assignment
  network_interface_ids = [ //implicit dependency on NIC
    azurerm_network_interface.example.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  //image details here 
  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  //custom data script to install packages or configure the VM
  custom_data = base64encode(<<EOF
#!/bin/bash
apt-get update
apt-get install -y nginx
systemctl enable nginx
systemctl start nginx
EOF
  )
}

