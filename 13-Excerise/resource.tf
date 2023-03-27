
provider "azurerm" { 
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name["${count.index}"]
  location = var.location["${count.index}"]
  count = 2
  depends_on = [azurerm_resource_group.back_rg]
}
resource "azurerm_resource_group" "back_rg" {
  name     = "Back_${var.resource_group_name["${count.index}"]}_RG"
  location = var.location["${count.index}"]
  count    = 2

  lifecycle {
    prevent_destroy = false
  }
}

resource "azurerm_virtual_network" "main" {
    name  ="${var.resource_group_name["${count.index}"]}_vNET"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example["${count.index}"].location
  resource_group_name = azurerm_resource_group.example["${count.index}"].name
  count = 2
}

resource "azurerm_subnet" "internal" {
  name                 = "internal${count.index}"
  resource_group_name  = azurerm_resource_group.example["${count.index}"].name
  virtual_network_name = azurerm_virtual_network.main["${count.index}"].name
  address_prefixes     = ["10.0.2.0/24"]
  count = 2
}

resource "azurerm_public_ip" "example" {
  name                = "myPublicIP${count.index}"
  resource_group_name = azurerm_resource_group.example["${count.index}"].name
  location            = azurerm_resource_group.example["${count.index}"].location
  allocation_method   = "Dynamic"
  count=2
}

resource "azurerm_network_interface" "main" {
  name                = "${var.resource_group_name["${count.index}"]}-nic"
  location            = azurerm_resource_group.example["${count.index}"].location
  resource_group_name = azurerm_resource_group.example["${count.index}"].name
   count = 2
  ip_configuration {
    name                          = "onnicMypublicip"
    subnet_id                     = azurerm_subnet.internal["${count.index}"].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example["${count.index}"].id
    }
}


resource "azurerm_network_security_group" "example" {
  name                = "myNSG1"
  location            = azurerm_resource_group.example["${count.index}"].location
  resource_group_name = azurerm_resource_group.example["${count.index}"].name
  count = 2

  security_rule {
    name                       = "SSH"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}


resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id          = azurerm_network_interface.main["${count.index}"].id
  network_security_group_id = azurerm_network_security_group.example["${count.index}"].id
  count = 2
}

resource "azurerm_virtual_machine" "main" {
  #name                  = "${var.resource_group_name}-vm${count.index}"
  name                  = "${var.resource_group_name["${count.index}"]}-vm"
  location              = azurerm_resource_group.example["${count.index}"].location
  resource_group_name   = azurerm_resource_group.example["${count.index}"].name
  network_interface_ids = [azurerm_network_interface.main["${count.index}"].id]
  vm_size               = var.VMTemplateSize
  count = var.VMcount

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.Disk_type
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = var.adminuser
    admin_password = var.adminpassword
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
 
}
output "myPublicIP" {
  value = [azurerm_public_ip.example[0].id,azurerm_public_ip.example[1].id]
    
}