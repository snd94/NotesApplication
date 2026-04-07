variable "data_rsg" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

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