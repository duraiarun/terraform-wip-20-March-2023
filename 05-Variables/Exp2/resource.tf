# Create a Resource Group
resource "azurerm_resource_group" "rg" { 
  name = var.my_rg_name 
  location = var.my_loc
  tags = { 
   Project = "DevOps"
   Env     = "Dev"
   Team    = "Azure DevOps"
  }
}
