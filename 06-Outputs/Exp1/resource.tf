# Create a Resource Group
resource "azurerm_resource_group" "rg" { 
  name = "${var.my_rg_name}-${count.index +1 }" 
  location = var.my_loc[count.index]
  #count = 3
  count = length(var.my_loc) 
  tags = { 
   Project = "DevOps"
   Env     = "Dev"
   Team    = "Azure DevOps"
  }
}



resource "azurerm_resource_group" "rg2" { 
  name = "Test-ABC-RG" 
  location = "eastus"
  tags = { 
   Project = "DevOps"
   Env     = "Dev"
   Team    = "Azure DevOps"
  }
}
