# Create a Resource Group
resource "azurerm_resource_group" "rg" { 
  name = "demo-1-rg" 
  location = "eastus"
  tags = { 
   Project = "DevOps"
   Env     = "Dev"
   Team    = "Azure DevOps"
  }
}
