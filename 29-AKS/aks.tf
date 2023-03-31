resource "azurerm_resource_group" "example" {
  name     = "myk8s-rg"
  location = "West Europe"
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "myk8scluster"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "myk8scluster"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}



resource "local_file" "kubeconfig" { 
  depends_on = [ azurerm_kubernetes_cluster.example ]
  filename = "kubeconfig"
  content  = azurerm_kubernetes_cluster.example.kube_config_raw
}

