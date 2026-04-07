module "private_endpoints" {
  source      = "./modules/private_endpoints"
  network_rsg = var.network_rsg
  location    = var.location
  vnet_id     = module.vnet.vnet_id
  subnet_id   = module.vnet.subnet_ids[var.private_endpoint_subnet]
  # cosmosdb_account_id  = module.cosmosdb.cosmosdb_id
  storage_account_id   = module.sa.storage_account_id
  cognitive_account_id = module.ai_foundry.cognitive_account_id
  search_service_id    = module.ai_search.search_service_id
  depends_on = [
    module.cosmosdb,
    module.sa,
    module.ai_foundry
  ]
}
