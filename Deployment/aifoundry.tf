module "ai_foundry" {
  depends_on             = [module.vnet]
  source                 = "./modules/aifoundry"
  data_rsg               = var.data_rsg
  location               = var.location
  cognitive_account_name = var.cognitive_account_name
  custom_subdomain_name  = var.custom_subdomain_name
  project_name           = var.project_name
  deployment_name        = var.deployment_name
  model_name             = var.model_name
  model_version          = var.model_version
  sku_name               = var.sku_name
  deployment_sku_name    = var.deployment_sku_name
  deployment_capacity    = var.deployment_capacity
  format                 = var.format
}
