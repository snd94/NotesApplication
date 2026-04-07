resource "azurerm_search_service" "aisearch" {
  name                = var.search_service_name
  resource_group_name = var.data_rsg
  location            = var.location

  sku             = var.ai_sku
  replica_count   = var.ai_replica_count
  partition_count = var.ai_partition_count

  identity {
    type = "SystemAssigned"
  }
  public_network_access_enabled = false

  local_authentication_enabled = true
}