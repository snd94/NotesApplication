module "container_apps" {
  depends_on     = [module.vnet]
  source         = "./modules/containerapps"
  location       = var.location
  compute_rsg    = var.compute_rsg
  subnet_ids     = module.vnet.subnet_ids
  environments   = var.environments
  container_apps = var.container_apps
}
