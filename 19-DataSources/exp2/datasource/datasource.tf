data "azurerm_resources" "example" { 
 resource_group_name = "example-rg"
}

output "resourcedetails" { 
  value = data.azurerm_resources.example
}

data "azurerm_virtual_machine" "example" {
  name                = "example-vm"
  resource_group_name = "example-rg"
}

output "virtual_machine_id" {
  value = data.azurerm_virtual_machine.example.id 
}

output "private_ip_address" { 
  value = data.azurerm_virtual_machine.example.private_ip_address
}



output "VM_Details" { 
  value = data.azurerm_virtual_machine.example
}
