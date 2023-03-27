resource "azurerm_resource_group" "example" {
  name     = "${var.my_rg_name}"
  location = var.my_loc

  tags = { 
    Owner = "AV" 
  }
}

# Create a virtual network 
resource "azurerm_virtual_network" "example" {
  name                = "${var.my_rg_name}-network"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = "Production"
  }
}

# Create a Subnets 

## Internal Subnet

resource "azurerm_subnet" "internal" {
  name                = "${var.my_rg_name}-sub-internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.7.0/24"]
}



## External Subnet

resource "azurerm_subnet" "external" {
  name                = "${var.my_rg_name}-sub-external"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}


## Network Interface Front

resource "azurerm_network_interface" "front" {
  count               = var.my_vm_count
  name                = "front-Nic-${count.index}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal-${count.index}"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id          = azurerm_public_ip.example.id
    public_ip_address_id          = element(azurerm_public_ip.front.*.id, count.index)
  }
}


## Public IP Config 

resource "azurerm_public_ip" "front" {
  count               = var.my_vm_count
  name                = "front-myPublicIP-${count.index}"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Dynamic"

  tags = { 
    environment = "Dev"
  }
}



## Network Interface back

resource "azurerm_network_interface" "back" {
  count               = var.my_vm_count
  name                = "back-Nic-${count.index}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal-${count.index}"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id          = azurerm_public_ip.example.id
    public_ip_address_id          = element(azurerm_public_ip.back.*.id, count.index)
  }
}


## Public IP Config 

resource "azurerm_public_ip" "back" {
  count               = var.my_vm_count
  name                = "back-myPublicIP-${count.index}"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Dynamic"

  tags = { 
    environment = "Dev"
  }
}


## NSG 

resource "azurerm_network_security_group" "example" {
  name                = "${var.my_rg_name}-nsg"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Dev"
  }
}
