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


# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}



# Create a VPC
resource "aws_vpc" "example2" {
  cidr_block = "10.0.0.0/16"
  provider = aws.myback
}
