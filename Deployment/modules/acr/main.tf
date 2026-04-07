
resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.compute_rsg
  location            = var.location

  sku           = var.sku
  admin_enabled = var.admin_enabled

  # Network Rule Set
  dynamic "network_rule_set" {
    for_each = var.network_rule_set != null ? [var.network_rule_set] : []
    content {
      default_action = network_rule_set.value.default_action

      dynamic "ip_rule" {
        for_each = network_rule_set.value.ip_rules
        content {
          action   = ip_rule.value.action
          ip_range = ip_rule.value.ip_range
        }
      }
    }
  }

  # Georeplication
  dynamic "georeplications" {
    for_each = var.georeplications
    content {
      location                = georeplications.value.location
      zone_redundancy_enabled = georeplications.value.zone_redundancy_enabled
      tags                    = georeplications.value.tags
    }
  }

  # Identity
  identity {
    type = var.identity_type
  }

  # Encryption
  dynamic "encryption" {
    for_each = var.encryption != null ? [var.encryption] : []
    content {
      key_vault_key_id   = encryption.value.key_vault_key_id
      identity_client_id = encryption.value.identity_client_id
    }
  }

  export_policy_enabled         = var.export_policy_enabled
  public_network_access_enabled = var.public_network_access_enabled
  data_endpoint_enabled         = var.data_endpoint_enabled
  anonymous_pull_enabled        = var.anonymous_pull_enabled
  zone_redundancy_enabled       = var.zone_redundancy_enabled
}