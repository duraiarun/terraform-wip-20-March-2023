provider "azurerm" { 
  features {}
}

/*
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



# Create a Resource Group
resource "azurerm_resource_group" "rg2" { 
  name = "demo-2-rg" 
  location = "eastus"
  tags = { 
   Project = "DevOps"
   Env     = "Dev"
   Team    = "Azure DevOps"
  }
}
*/





# Create a Resource Group
resource "azurerm_resource_group" "rg" { 
  count = 3
  name = "Apple-RG-${count.index}"
  location = "eastus"
  tags = { 
   Project = "DevOps"
   Env     = "Dev"
   Team    = "Azure DevOps"
  }
}

