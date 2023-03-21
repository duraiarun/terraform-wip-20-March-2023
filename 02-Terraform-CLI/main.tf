provider "azurerm" {
  features {}
}


# Create a Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "cherry-rg"
  location = "eastus"
  tags = {
    Project = "DevOps"
    Env     = "Dev"
    Team    = "Azure DevOps"
  }
}



# Create a Resource Group
resource "azurerm_resource_group" "rg2" {
  name     = "orange-rg"
  location = "eastus"
  tags = {
    Project = "Terraform Automation"
    Env     = "Dev"
    Team    = "Azure DevOps"
  }
}
