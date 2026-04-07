# Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "law" {
  name                       = var.log_analytics_workspace_name
  location                   = var.location
  resource_group_name        = var.compute_rsg
  sku                        = var.law_sku
  retention_in_days          = var.retention_in_days
  daily_quota_gb             = var.daily_quota_gb
  internet_ingestion_enabled = var.internet_ingestion_enabled
  internet_query_enabled     = var.internet_query_enabled
}

# Application Insights
resource "azurerm_application_insights" "appinsights" {
  name                 = var.app_insights_name
  location             = var.location
  resource_group_name  = var.compute_rsg
  application_type     = var.application_type
  workspace_id         = azurerm_log_analytics_workspace.law.id
  retention_in_days    = var.appinsights_retention_in_days
  sampling_percentage  = var.sampling_percentage
  daily_data_cap_in_gb = var.daily_data_cap_in_gb
  disable_ip_masking   = var.disable_ip_masking
}

# Diagnostic Setting (Optional - example for resource monitoring)
resource "azurerm_monitor_diagnostic_setting" "diag" {
  name                       = var.diagnostic_name
  target_resource_id         = azurerm_application_insights.appinsights.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id

  dynamic "enabled_log" {
    for_each = var.log_categories
    content {
      category = enabled_log.value
    }
  }

  dynamic "metric" {
    for_each = var.metric_categories
    content {
      category = metric.value
      enabled  = true
    }
  }
}