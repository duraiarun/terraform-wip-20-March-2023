variable "my_rg_name" { 
  default = "test"
}


variable "my_loc" { 
  default = "eastus"
}


variable "my_vm_count" { 
  default = "1"
}

variable "vm_size" { 
  default = "Standard_B1s"
}



variable "managed_disk_type" { 
  default = { 
   westus = "Premium_LRS"
   eastus = "Standard_LRS"
  }
}

variable "my_nic_id" {}

variable "tags" {
  default = {
    env = "dev"
  }
 }
