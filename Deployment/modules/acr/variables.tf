variable "acr_name" {
  type = string
}

variable "compute_rsg" {
  type = string
}

variable "location" {
  type = string
}

variable "sku" {
  type = string
}

variable "admin_enabled" {
  type = bool
}

variable "identity_type" {
  type = string
}

variable "export_policy_enabled" {
  type = bool
}

variable "public_network_access_enabled" {
  type = bool
}

variable "data_endpoint_enabled" {
  type = bool
}

variable "anonymous_pull_enabled" {
  type = bool
}

variable "zone_redundancy_enabled" {
  type = bool
}

variable "network_rule_set" {
  type = object({
    default_action = string
    ip_rules = list(object({
      action   = string
      ip_range = string
    }))
  })
}

variable "georeplications" {
  type = list(object({
    location                = string
    zone_redundancy_enabled = bool
    tags                    = optional(map(string))
  }))
}

variable "encryption" {
  type = object({
    enabled            = bool
    key_vault_key_id   = string
    identity_client_id = string
  })
}

