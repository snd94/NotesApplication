variable "network_rsg" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_id" {
  description = "Virtual Network ID"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for Private Endpoints"
  type        = string
}


variable "cosmosdb_account_id" {
  description = "Cosmos DB Account ID"
  type        = string
}

variable "search_service_id" {
  description = "Azure AI Search Service ID"
  type        = string
}

variable "storage_account_id" {
  description = "Storage Account ID"
  type        = string
}

variable "cognitive_account_id" {
  description = "Azure AI Foundry Cognitive Account ID"
  type        = string
}

variable "private_endpoint_subnet" {
  type    = string
  default = "service"
}