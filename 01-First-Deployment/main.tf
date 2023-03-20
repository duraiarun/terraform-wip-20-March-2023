provider "azurerm" { 
  features {}
}


# Create a Resource Group
resource "azurerm_resource_group" "rg" { 
  name = "demo-1-rg" 
  location = "eastus"
}
