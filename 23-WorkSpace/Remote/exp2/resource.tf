# Create a Resource Group
resource "azurerm_resource_group" "rg" { 
  name = "${var.a}-${terraform.workspace}-${count.index +1 }" 
  location = var.my_loc[count.index]
  count = lookup(var.rg_count, terraform.workspace) 
  tags = { 
   Project = "DevOps"
   Env     = "Dev"
   Team    = "Azure DevOps - ${terraform.workspace}"
  }
}
