module "keyvault" {
  depends_on     = [module.vnet]
  source         = "./modules/azkeyvault"
  key_vault_name = var.key_vault_name
  data_rsg       = var.data_rsg
  location       = var.location
  kv_sku_name    = var.kv_sku_name
}
