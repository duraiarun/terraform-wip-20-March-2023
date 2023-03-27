/*
1.Locations 
2. VMcount 
3. RG-Name 
4. AdminUser,AdminPass,DiskType ( Location Based ) 
5. VMTemplateSize ( Location Based )
*/
variable "location" {
    description = "Location of resources"
    type = list
    default = ["eastus","westus"]
  }
variable "VMcount" {
  description = "VMCount"
  default = 2
}
variable "resource_group_name" {
    description = "Name of resource group"
    type = list
    default =["VM_RGeastus","VM_RGwestus"]
}

variable "adminuser" {
    description="Admin username"
    default = "adminuser"
}

variable "adminpassword" {
    description = "Admin password"
    default = "Test@1234"
}
variable "VMTemplateSize" {
  description = "VM Size"
  default = "Standard_DS1_v2"
}
variable "Disk_type" {
    description="disk type of vm"
    default = "Standard_LRS"
}