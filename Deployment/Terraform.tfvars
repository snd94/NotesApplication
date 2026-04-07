location      = "swedencentral"
compute_rsg   = "rg-compute"
data_rsg      = "rg-data"
network_rsg   = "rg-network"
vnet_name     = "vnet-mss-dev"
address_space = ["10.0.0.0/16"]

subnets = {
  agent = {
    name                      = "agent-subnet"
    address_prefix            = "10.0.0.0/27"
    delegate_to_containerapps = true
  }

  frontend = {
    name                      = "frontend-subnet"
    address_prefix            = "10.0.0.32/27"
    delegate_to_containerapps = true
  }

  service = {
    name                      = "service-subnet"
    address_prefix            = "10.0.0.64/27"
    delegate_to_containerapps = false
  }

  foundry = {
    name                      = "foundry-subnet"
    address_prefix            = "10.0.0.96/27"
    delegate_to_containerapps = false
  }
}

# Storage Account
sa_name                  = "stgmssdev"
account_tier             = "Standard"
account_replication_type = "LRS"
account_kind             = "StorageV2"
access_tier              = "Hot"

# Cosmos Db
# Core
cdb_name = "cosmos-mss-dev-001"


# Account
kind                          = "GlobalDocumentDB"
public_network_access_enabled = false

# SQL DB
create_sql_database = true
sql_database_name   = "sqldb"
sql_db_throughput   = 400

# SQL Container
create_sql_container = true
sql_container_name   = "container"
partition_key_path   = ["/id"]
container_throughput = 400

#container apps

environments = {
  backend = {
    name        = "cae-backend-env"
    subnet      = "agent"
    internal_lb = true
  }

  frontend = {
    name        = "cae-frontend-env"
    subnet      = "frontend"
    internal_lb = false
  }
}

container_apps = {
  # 6 Backend Apps
  app1 = {
    name           = "ca-agent-1"
    revision_mode  = "Single"
    container_name = "app1"
    image          = "python:3.10"
    cpu            = 0.5
    memory         = "1Gi"
    environment    = "backend"
    target_port    = 8080
  }

  app2 = {
    name           = "ca-agent-2"
    revision_mode  = "Single"
    container_name = "app2"
    image          = "python:3.10"
    cpu            = 0.5
    memory         = "1Gi"
    environment    = "backend"
    target_port    = 8080
  }

  app3 = {
    name           = "ca-agent-3"
    revision_mode  = "Single"
    container_name = "app3"
    image          = "python:3.10"
    cpu            = 0.5
    memory         = "1Gi"
    environment    = "backend"
    target_port    = 8080
  }

  app4 = {
    name           = "ca-agent-4"
    revision_mode  = "Single"
    container_name = "app4"
    image          = "python:3.10"
    cpu            = 0.5
    memory         = "1Gi"
    environment    = "backend"
    target_port    = 8080
  }

  app5 = {
    name           = "ca-agent-5"
    revision_mode  = "Single"
    container_name = "app5"
    image          = "python:3.10"
    cpu            = 0.5
    memory         = "1Gi"
    environment    = "backend"
    target_port    = 8080
  }

  app6 = {
    name           = "ca-agent-6"
    revision_mode  = "Single"
    container_name = "app6"
    image          = "python:3.10"
    cpu            = 0.5
    memory         = "1Gi"
    environment    = "backend"
    target_port    = 8080
  }

  # Frontend App
  frontend = {
    name           = "frontend-app"
    revision_mode  = "Single"
    container_name = "frontend"
    image          = "nginx:latest"
    cpu            = 0.5
    memory         = "1Gi"
    environment    = "frontend"
    target_port    = 80
  }
}

# ai foundry

cognitive_account_name = "ai-fdry-mcc-dev-01"
custom_subdomain_name  = "ai-fdry-sdomain-mcc-01"
project_name           = "project-mcc-dev"
deployment_name        = "gpt-4o"
model_name             = "gpt-4o"
model_version          = "2024-11-20"
sku_name               = "S0"
deployment_sku_name    = "GlobalStandard"
deployment_capacity    = 1
format                 = "OpenAI"

# ai search
search_service_name = "ai-srch-mcc-dev"
ai_sku              = "standard"
ai_replica_count    = 1
ai_partition_count  = 1

#acr

acr_name                = "acrregistrymcc"
sku                     = "Premium"
admin_enabled           = false
identity_type           = "SystemAssigned"
export_policy_enabled   = true
data_endpoint_enabled   = true
anonymous_pull_enabled  = false
zone_redundancy_enabled = true

network_rule_set = {
  default_action = "Deny"
  ip_rules       = []
}

georeplications = []

encryption = null

# kv

key_vault_name = "kvmccdev"
kv_sku_name    = "standard"

# azure monitor

log_analytics_workspace_name = "law-mcc-dev"
law_sku                      = "PerGB2018"
retention_in_days            = 30
daily_quota_gb               = 1
internet_ingestion_enabled   = true
internet_query_enabled       = true

app_insights_name             = "appi-mcc-dev"
application_type              = "web"
appinsights_retention_in_days = 30
sampling_percentage           = 100
daily_data_cap_in_gb          = 1
disable_ip_masking            = false

diagnostic_name = "diag-mcc-appinsights"

log_categories    = []
metric_categories = ["AllMetrics"]

# NEW (for private endpoints routing)

private_endpoint_subnet = "service"

