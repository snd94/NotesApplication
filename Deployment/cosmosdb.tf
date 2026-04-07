# module "cosmosdb" {
#   depends_on                    = [module.vnet]
#   source                        = "./modules/cosmosdb"
#   cdb_name                      = var.cdb_name
#   location                      = var.location
#   data_rsg                      = var.data_rsg
#   kind                          = var.kind
#   public_network_access_enabled = var.public_network_access_enabled
#   create_sql_database           = var.create_sql_database
#   sql_database_name             = var.sql_database_name
#   sql_db_throughput             = var.sql_db_throughput
#   create_sql_container          = var.create_sql_container
#   sql_container_name            = var.sql_container_name
#   partition_key_path            = var.partition_key_path
#   container_throughput          = var.container_throughput
# }
