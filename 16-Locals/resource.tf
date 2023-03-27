locals { 
  default_name = "${join("-", tolist([var.project_name, var.my_rg_prefix]))}"
}


locals {
  project_tags = { 
    Owner   = "Amit Vashist"
    Team    = "DevOps"
    Env     = "Production"
    Name    = upper(local.default_name)
 }
}


resource "azurerm_resource_group" "blue" {
  name     = "${var.mytest}-blue"
  location = var.my_loc
  tags = local.project_tags
}



resource "azurerm_resource_group" "red" {
  name     = "${local.default_name}-red"
  location = var.my_loc

  tags = local.project_tags
}

resource "azurerm_resource_group" "orange" {

  name     = "${local.default_name}-orange"
  location = var.my_loc

  tags = local.project_tags
}
