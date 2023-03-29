module "myvnet" { 
  source = "../modules/network"
}



module "myvnet-2" { 
  source = "../modules/network"
  my_rg_name = "devops"
  my_loc     = "westus"
  my_vnet_cidr = ["192.168.0.0/16"]
  my_snet_internal_cidr = ["192.168.1.0/24"]
  my_snet_external_cidr = ["192.168.5.0/24"]
  my_vm_count = 3
}



module "compute" { 
  source = "../modules/compute"
  my_rg_name = "devops"
  my_loc     = "westus"
  my_vm_count = 3
  my_nic_id   = module.myvnet-2.my_nic_out
}




module "myvnet-3" { 
  source = "../modules/network"
  my_rg_name = "devops-2"
  my_loc     = "westus"
  my_vnet_cidr = ["192.168.0.0/16"]
  my_snet_internal_cidr = ["192.168.1.0/24"]
  my_snet_external_cidr = ["192.168.5.0/24"]
  my_vm_count = 2
}



module "compute-3" { 
  source = "../modules/compute"
  my_rg_name = "devops-2"
  my_loc     = "westus"
  my_vm_count = 2
  my_nic_id   = module.myvnet-3.my_nic_out
}
