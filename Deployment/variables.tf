# -------------------------
# GLOBAL
# -------------------------
variable "location" {
  description = "Azure region"
  type        = string
}

variable "rg-compute" {
  description = "Resource Group Name"
  type        = string
}

variable "rg-data" {
  description = "Resource Group Name"
  type        = string
}

variable "rg-network" {
  description = "Resource Group Name"
  type        = string
}

# -------------------------
# VNET
# -------------------------
variable "vnet_name" {
  description = "VNet name"
  type        = string
}

variable "address_space" {
  description = "VNet address space"
  type        = list(string)
}

# -------------------------
# SUBNETS
# -------------------------
variable "subnets" {
  description = "Subnet configuration"
  type = map(object({
    name                      = string
    address_prefix            = string
    delegate_to_containerapps = optional(bool, false)
    enable_private_endpoint   = optional(bool, true)
  }))
}

# SA

variable "sa_name" {
  description = "Name of the Storage Account (must be globally unique)"
  type        = string
}


variable "account_tier" {
  description = "Storage account tier"
  type        = string
}

variable "account_replication_type" {
  description = "Replication type for Storage Account"
  type        = string
}

variable "account_kind" {
  description = "Storage account kind"
  type        = string
}

variable "access_tier" {
  description = "Access tier for Blob storage"
  type        = string
}

# Cosmos DB

variable "cdb_name" {
  description = "Cosmos DB account name"
  type        = string
}

variable "kind" {
  description = "Cosmos DB kind"
  type        = string
}

variable "public_network_access_enabled" {
  description = "Enable public network access"
  type        = bool
}

# SQL DB
variable "create_sql_database" {
  description = "Flag to create SQL database"
  type        = bool
}

variable "sql_database_name" {
  description = "SQL database name"
  type        = string
}

variable "sql_db_throughput" {
  description = "SQL DB throughput"
  type        = number
}

# SQL Container
variable "create_sql_container" {
  description = "Flag to create SQL container"
  type        = bool
}

variable "sql_container_name" {
  description = "SQL container name"
  type        = string
}

variable "partition_key_path" {
  description = "Partition key path"
  type        = list(string)
}

variable "container_throughput" {
  description = "Container throughput"
  type        = number
}
#container Apps

# Environments (2 or more supported)
variable "environments" {
  description = "Container App Environments"

  type = map(object({
    name        = string
    subnet      = string
    internal_lb = bool
  }))
}

# Container Apps
variable "container_apps" {
  type = map(object({
    name           = string
    environment    = string
    revision_mode  = string
    target_port    = number
    container_name = string
    image          = string
    cpu            = number
    memory         = string
  }))
}

# ai foundry

variable "cognitive_account_name" {
  description = "Name of the AI Foundry Cognitive Account"
  type        = string
}

variable "custom_subdomain_name" {
  description = "Custom subdomain for Cognitive Account"
  type        = string
}

variable "project_name" {
  description = "Name of the Cognitive Project"
  type        = string
}

variable "deployment_name" {
  description = "Name of the model deployment"
  type        = string
}

variable "model_name" {
  description = "Model name (e.g., gpt-4o)"
  type        = string
}

variable "model_version" {
  description = "Model version"
  type        = string
}

variable "sku_name" {
  description = "Cognitive Account SKU"
  type        = string
}

variable "deployment_sku_name" {
  description = "Deployment SKU name"
  type        = string
}

variable "deployment_capacity" {
  description = "Deployment capacity"
  type        = number
}

variable "format" {
  description = "format"
  type        = string
}


# Ai Search
variable "search_service_name" {
  type = string
}


variable "ai_sku" {
  type = string
}

variable "ai_replica_count" {
  type = number
}

variable "ai_partition_count" {
  type = number
}

# acr

variable "acr_name" {
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

# kv

variable "key_vault_name" {
  type        = string
  description = "Key Vault Name"
}

variable "kv_sku_name" {
  type = string
}

# azure monitor

variable "log_analytics_workspace_name" {
  type = string
}


variable "law_sku" {
  type = string
}

variable "retention_in_days" {
  type = number
}

variable "daily_quota_gb" {
  type = number
}

variable "internet_ingestion_enabled" {
  type = bool
}

variable "internet_query_enabled" {
  type = bool
}

variable "app_insights_name" {
  type = string
}

variable "application_type" {
  type = string
}

variable "appinsights_retention_in_days" {
  type = number
}

variable "sampling_percentage" {
  type = number
}

variable "daily_data_cap_in_gb" {
  type = number
}

variable "disable_ip_masking" {
  type = bool
}

variable "diagnostic_name" {
  type = string
}

variable "log_categories" {
  type = list(string)
}

variable "metric_categories" {
  type = list(string)
}

# pep

variable "private_endpoint_subnet" {
  type    = string
  default = "service"
}