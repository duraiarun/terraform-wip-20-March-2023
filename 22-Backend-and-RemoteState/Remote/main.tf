# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  count    = 5
  name     = "Orange-RG-${count.index +1}"
  location = "eastus"

  tags = {
    Owner   = "Amit Vashist"
    Team    = "DevOps"
 }
}
