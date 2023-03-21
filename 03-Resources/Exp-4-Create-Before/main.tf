provider "azurerm" { 
  features {}
}

resource "azurerm_resource_group" "front" { 
  count = 1
  name = "frontend-${count.index}"
  location = "eastus"

  tags = { 
   Project = "DevOps"
   Env     = "Dev"
   Team    = "Azure DevOps"
  }

  lifecycle { 
    create_before_destroy = true
  }

}

resource "azurerm_resource_group" "back" { 
  count = 1
  name = "backend-RG-${count.index}"
  location = "eastus"
  tags = { 
   Project = "DevOps"
   Env     = "Dev"
   Team    = "Azure DevOps"
  }
}

