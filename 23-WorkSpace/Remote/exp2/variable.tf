variable "a" { 
  default  = "xyz"
  type = string
  description = "My Resource Group Name"
}


variable "my_loc" { 
  type = list
  description = "My Resource Group Location"
  default  = [ "eastus", "eastus2", "westus" ]
  #default  = [ "eastus" ]
}

variable "rg_count" { 
  type = map 
  default = { 
    default = "1"
    uat     = "2"
    prod    = "3"
  }
}
