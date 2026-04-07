module "acr" {
  depends_on                    = [module.vnet]
  source                        = "./modules/acr"
  acr_name                      = var.acr_name
  compute_rsg                   = var.compute_rsg
  location                      = var.location
  sku                           = var.sku
  admin_enabled                 = var.admin_enabled
  identity_type                 = var.identity_type
  export_policy_enabled         = var.export_policy_enabled
  public_network_access_enabled = var.public_network_access_enabled
  data_endpoint_enabled         = var.data_endpoint_enabled
  anonymous_pull_enabled        = var.anonymous_pull_enabled
  zone_redundancy_enabled       = var.zone_redundancy_enabled
  network_rule_set              = var.network_rule_set
  georeplications               = var.georeplications
  encryption                    = var.encryption
}
