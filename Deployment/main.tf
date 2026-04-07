data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "compute" {
  name = var.compute_rsg
}

data "azurerm_resource_group" "data" {
  name = var.data_rsg
}

data "azurerm_resource_group" "network" {
  name = var.network_rsg
}