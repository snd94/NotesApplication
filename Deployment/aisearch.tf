module "ai_search" {
  depends_on          = [module.vnet]
  source              = "./modules/aisearch"
  search_service_name = var.search_service_name
  data_rsg            = var.data_rsg
  location            = var.location
  ai_sku              = var.ai_sku
  ai_replica_count    = var.ai_replica_count
  ai_partition_count  = var.ai_partition_count
}
