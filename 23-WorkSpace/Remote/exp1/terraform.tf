terraform { 
  required_providers { 
   azurerm = {
     source = "hashicorp/azurerm"
     #version = "=2.97.0"
   }
 }

  backend "azurerm" {
    resource_group_name  = "k8s-rg"
    storage_account_name = "k8sazurestg30032023"
    container_name       = "myterraformstate"
    key                  = "terraform.tfstate"
  }

 
}
