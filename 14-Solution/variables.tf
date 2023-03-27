variable "my_loc" { default = "eastus" }
variable "my_vm_loc" {
 default = [ "eastus" , "westus" ]

}
variable "my_vm_count" { default = 2 }
variable "my_rg_name" { default = "TestRG" }
variable "admin_username" {
  type = string
}


variable "admin_password" {
  type = string
}


variable "managed_disk_type" {
  type = map

  default = { 
   eastus = "Standard_LRS"
   westus = "Premium_LRS"
  }
  
}

variable "vm_size" { 
  type = string 
  default  = "Standard_B1s"
}
