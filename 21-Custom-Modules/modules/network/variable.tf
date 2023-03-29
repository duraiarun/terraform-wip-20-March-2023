variable "my_rg_name" { 
  default = "test"
}




variable "my_loc" { 
  default = "eastus"
}


variable "my_vm_count" { 
  default = "1"
}



variable "my_vnet_cidr" { 
  default = ["10.0.0.0/16"]
}


variable "my_snet_internal_cidr" { 
  default = ["10.0.1.0/24"]
}



variable "my_snet_external_cidr" { 
  default = ["10.0.5.0/24"]
}


variable "tags" {
  default = {
    env = "dev"
  }
 } 
