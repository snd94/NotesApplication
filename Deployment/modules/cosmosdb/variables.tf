variable "cdb_name" {
  description = "Cosmos DB account name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "data_rsg" {
  description = "Resource Group name"
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