resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_dns_zone" "example" {
  name                = "av.mydomain.com"
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_dns_a_record" "example" {
  name                = "myvm01"
  zone_name           = azurerm_dns_zone.example.name
  resource_group_name = azurerm_resource_group.example.name
  ttl                 = 300
  records             = ["10.0.100.17"]
}


resource "azurerm_dns_a_record" "example-1" {
  name                = "myvm02"
  zone_name           = azurerm_dns_zone.example.name
  resource_group_name = azurerm_resource_group.example.name
  ttl                 = 300
  records             = ["10.0.100.18"]
}
