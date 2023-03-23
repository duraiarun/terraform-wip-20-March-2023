variable "my_rg_name" { 
  default  = "Test-RG"
  type = string
  description = "My Resource Group Name"
}


variable "my_loc" { 
  type = list
  description = "My Resource Group Location"
  default  = [ "eastus", "eastus2", "westus" ]
  #default  = [ "eastus" ]
}

