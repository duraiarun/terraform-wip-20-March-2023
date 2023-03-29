output "my_nic_out" { 
 value = azurerm_network_interface.example.*.id
}

