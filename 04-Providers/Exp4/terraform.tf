terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.40, <=2.48"
    }
    aws = { 
      source  = "hashicorp/aws"
      version = "=4.40"
    }
    
  }
}
