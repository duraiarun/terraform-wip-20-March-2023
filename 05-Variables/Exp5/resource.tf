# Create a Resource Group
resource "azurerm_resource_group" "rg" { 
  name = "${var.a}-${count.index +1 }" 
  location = var.my_loc
  count = 3
  tags = { 
   Project = "DevOps"
   Env     = "Dev"
   Team    = "Azure DevOps"
  }
}
