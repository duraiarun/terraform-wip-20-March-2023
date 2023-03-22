# Create a Resource Group
resource "azurerm_resource_group" "rg" { 
  name = var.a 
  location = var.my_loc
  tags = { 
   Project = "DevOps"
   Env     = "Dev"
   Team    = "Azure DevOps"
  }
}
