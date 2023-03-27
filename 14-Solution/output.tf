
output "my_public_ip_front" {
   value = "${azurerm_public_ip.front.*.ip_address}"
}


output "my_public_ip_back" {
   value = "${azurerm_public_ip.back.*.ip_address}"
}
