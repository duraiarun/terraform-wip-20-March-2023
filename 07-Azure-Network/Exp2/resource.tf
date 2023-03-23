resource "azurerm_subnet" "external-2" {
  name                 = "external-subnet-2"
  resource_group_name  = "my-rg"
  virtual_network_name = "example-network"
  address_prefixes     = ["10.0.7.0/24"]
}
