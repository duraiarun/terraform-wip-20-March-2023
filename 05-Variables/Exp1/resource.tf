variable "my_rg_name" { 
  type = string
  default  = "myrg"
}


variable "my_loc" { 
  type = string
  default  = "westus"
}


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
