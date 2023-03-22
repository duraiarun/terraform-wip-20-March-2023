provider "azurerm" { 
  features {}
}


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}



provider "aws" {
  region = "us-west-1"
  alias  = "mybackup"
}
