/*
module "myvnet" { 
  source = "../modules/network"
}
*/



module "myvnet-2" { 
  source = "../modules/network"
  my_rg_name = "k8s"
  my_loc     = "eastus"
  my_vnet_cidr = ["10.0.0.0/16"]
  my_snet_internal_cidr = ["10.0.1.0/24"]
  my_snet_external_cidr = ["10.0.5.0/24"]
  my_vm_count = 3
}



module "compute" { 
  source = "../modules/compute"
  my_rg_name = "k8s"
  my_loc     = "eastus"
  my_vm_count = 3
  my_nic_id   = module.myvnet-2.my_nic_out
  vm_size     = "Standard_D2s_v3"
}


/*

module "myvnet-3" { 
  source = "../modules/network"
  my_rg_name = "devops-2"
  my_loc     = "westus"
  my_vnet_cidr = ["192.168.0.0/16"]
  my_snet_internal_cidr = ["192.168.2.0/24"]
  my_snet_external_cidr = ["192.168.3.0/24"]
  my_vm_count = 2
}



module "compute-3" { 
  source = "../modules/compute"
  my_rg_name = "devops-2"
  my_loc     = "westus"
  my_vm_count = 2
  my_nic_id   = module.myvnet-3.my_nic_out
}
*/
