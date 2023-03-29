terraform { 
  required_providers { 
   azurerm = {
     source = "hashicorp/azurerm"
     #version = "=2.97.0"
   }
 }

  backend "azurerm" {
    resource_group_name  = "tstate"
    storage_account_name = "tstate27212"
    container_name       = "tstate"
    key                  = "prod.terraform.tfstate"
  }

 
}
