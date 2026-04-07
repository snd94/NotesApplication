module "vnet" {
  source        = "./modules/vnet"
  location      = var.location
  network_rsg   = var.network_rsg
  vnet_name     = var.vnet_name
  address_space = var.address_space
  subnets       = var.subnets
}
