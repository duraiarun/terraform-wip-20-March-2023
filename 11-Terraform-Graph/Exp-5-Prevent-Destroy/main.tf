provider "azurerm" { 
  features {}
}

resource "azurerm_resource_group" "front" { 
  count = 2
  name = "Apple-RG-${count.index}"
  location = "eastus"

 # depends_on = [ azurerm_resource_group.back ] 
  tags = { 
   Project = "DevOps"
   Env     = "Dev"
   Team    = "Azure DevOps"
  }
}

resource "azurerm_resource_group" "back" { 
  count = 2
  name = "Mango-RG-${count.index}"
  location = "eastus"
  tags = { 
   Project = "DevOps"
   Env     = "Dev"
   Team    = "Azure DevOps"
  }

 lifecycle { 
  prevent_destroy = false
  }

}

