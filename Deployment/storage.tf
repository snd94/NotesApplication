module "sa" {
  depends_on               = [module.vnet]
  source                   = "./modules/sa"
  sa_name                  = var.sa_name
  location                 = var.location
  data_rsg                 = var.data_rsg
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind
  access_tier              = var.access_tier
}
