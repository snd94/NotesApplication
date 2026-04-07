# -------------------------
# GLOBAL
# -------------------------
variable "location" {
  description = "Azure region"
  type        = string
}

variable "network_rsg" {
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

