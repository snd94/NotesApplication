resource "azurerm_cognitive_account" "foundry" {
  name                       = var.cognitive_account_name
  location                   = var.location
  resource_group_name        = var.data_rsg
  kind                       = "AIServices"
  sku_name                   = "S0"
  custom_subdomain_name      = var.custom_subdomain_name
  project_management_enabled = true

  identity {
    type = "SystemAssigned"
  }
  public_network_access_enabled = false
  local_auth_enabled            = false
}

resource "azurerm_cognitive_account_project" "project" {
  name                 = var.project_name
  cognitive_account_id = azurerm_cognitive_account.foundry.id
  location             = var.location

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_cognitive_deployment" "gpt4o" {
  name                 = var.deployment_name
  cognitive_account_id = azurerm_cognitive_account.foundry.id

  sku {
    name     = var.deployment_sku_name
    capacity = 1
  }

  model {
    format  = var.format
    name    = var.model_name
    version = var.model_version
  }
}