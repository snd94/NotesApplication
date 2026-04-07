variable "compute_rsg" {
  type = string
}

variable "location" {
  type = string
}

# ✅ FIXED (string instead of list)
variable "log_analytics_workspace_name" {
  type = string
}

# ✅ FIXED
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

