resource "azurerm_cosmosdb_account" "cosmos" {
  name                = var.cdb_name
  location            = var.location
  resource_group_name = var.data_rsg
  offer_type          = "Standard"
  kind                = var.kind

  public_network_access_enabled = var.public_network_access_enabled

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }

}

# SQL Database
resource "azurerm_cosmosdb_sql_database" "db" {
  count               = var.create_sql_database ? 1 : 0
  name                = var.sql_database_name
  resource_group_name = var.data_rsg
  account_name        = azurerm_cosmosdb_account.cosmos.name

  throughput = var.sql_db_throughput
}

# SQL Container
resource "azurerm_cosmosdb_sql_container" "container" {
  count               = var.create_sql_container ? 1 : 0
  name                = var.sql_container_name
  resource_group_name = var.data_rsg
  account_name        = azurerm_cosmosdb_account.cosmos.name
  database_name       = azurerm_cosmosdb_sql_database.db[0].name
  partition_key_paths = var.partition_key_path
  throughput          = var.container_throughput

  indexing_policy {
    indexing_mode = "consistent"

    included_path {
      path = "/*"
    }
  }
}