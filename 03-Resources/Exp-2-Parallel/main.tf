provider "azurerm" { 
  features {}
}

resource "azurerm_resource_group" "front" { 
  count = 1
  name = "Frontend-RG-${count.index}"
  location = "eastus"
  tags = { 
   Project = "DevOps"
   Env     = "Dev"
   Team    = "Azure DevOps"
  }
}

resource "azurerm_resource_group" "back" { 
  count = 1
  name = "Backend-RG-${count.index}"
  location = "eastus"
  tags = { 
   Project = "DevOps"
   Env     = "Dev"
   Team    = "Azure DevOps"
  }
}

