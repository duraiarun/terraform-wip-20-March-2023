resource "azurerm_resource_group" "rg" { 
  name = "${var.my_rg_name}-rg" 
  location = var.my_loc
  tags = var.tags
}

resource "azurerm_virtual_network" "example" {
  name = "${var.my_rg_name}-vnet" 
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.my_vnet_cidr
  tags = var.tags
}



resource "azurerm_subnet" "internal" {
  name = "${var.my_rg_name}-snet-internal" 
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.my_snet_internal_cidr
}


resource "azurerm_subnet" "external" {
  name = "${var.my_rg_name}-snet-external" 
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.my_snet_external_cidr
}



resource "azurerm_network_interface" "example" {
  count               = var.my_vm_count
  name = "${var.my_rg_name}-nic-${count.index}" 
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "myinteralIP-${count.index}"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}
