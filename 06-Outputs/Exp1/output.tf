output "my_rg_names" { 
  value = azurerm_resource_group.rg.*.name
}



output "my_rg_loc" { 
  value = azurerm_resource_group.rg.*.location
}


output "my_first_rg_details" { 
  value = [ azurerm_resource_group.rg.0.location , azurerm_resource_group.rg.0.name , azurerm_resource_group.rg.0.id ] 
}




output "my_rg_names-2" { 
  value = azurerm_resource_group.rg2.name
}



output "my_rg_loc-2" { 
  value = azurerm_resource_group.rg2.location
}

