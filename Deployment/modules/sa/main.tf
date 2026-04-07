resource "azurerm_storage_account" "sa" {
  name                          = var.sa_name
  resource_group_name           = var.data_rsg
  location                      = var.location
  account_tier                  = var.account_tier
  account_replication_type      = var.account_replication_type
  account_kind                  = var.account_kind
  access_tier                   = var.access_tier
  public_network_access_enabled = false
}