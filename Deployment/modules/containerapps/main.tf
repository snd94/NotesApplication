# Create multiple Container App Environments
# -------------------------
# CONTAINER APP ENVIRONMENTS
# -------------------------
resource "azurerm_container_app_environment" "env" {
  for_each                       = var.environments
  name                           = each.value.name
  location                       = var.location
  resource_group_name            = var.compute_rsg
  infrastructure_subnet_id       = var.subnet_ids[each.value.subnet]
  internal_load_balancer_enabled = each.value.internal_lb
  public_network_access          = each.value.internal_lb ? "Disabled" : "Enabled"

}

# Create Container Apps mapped to environments
resource "azurerm_container_app" "apps" {
  for_each                     = var.container_apps
  name                         = each.value.name
  resource_group_name          = var.compute_rsg
  revision_mode                = each.value.revision_mode
  container_app_environment_id = azurerm_container_app_environment.env[each.value.environment].id

  template {
    container {
      name   = each.value.container_name
      image  = each.value.image
      cpu    = each.value.cpu
      memory = each.value.memory
    }
  }
  # -------------------------
  # INGRESS CONTROL
  # -------------------------

  # Frontend → Public
  dynamic "ingress" {
    for_each = each.value.environment == "frontend" ? [1] : []

    content {
      external_enabled = true
      target_port      = each.value.target_port

      traffic_weight {
        percentage      = 100
        latest_revision = true
      }
    }
  }

  # Backend → Private Only
  dynamic "ingress" {
    for_each = each.value.environment == "backend" ? [1] : []

    content {
      external_enabled = false
      target_port      = each.value.target_port

      traffic_weight {
        percentage      = 100
        latest_revision = true
      }
    }
  }
}


