variable "location" {
  type = string
}

variable "compute_rsg" {
  type = string
}

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
    environment    = string # links to environments map key
    revision_mode  = string
    target_port    = number
    container_name = string
    image          = string
    cpu            = number
    memory         = string
  }))
}


variable "subnet_ids" {
  description = "Map of subnet IDs from VNet module"
  type        = map(string)
}