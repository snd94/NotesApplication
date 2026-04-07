variable "sa_name" {
  description = "Name of the Storage Account (must be globally unique)"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
}

variable "data_rsg" {
  description = "Resource Group Name"
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
