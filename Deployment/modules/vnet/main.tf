# -------------------------
# VNET (OPTIONAL CREATE)
# -------------------------
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.network_rsg
  address_space       = var.address_space

}

# -------------------------
# SUBNETS
# -------------------------
resource "azurerm_subnet" "subnets" {
  for_each             = var.subnets
  name                 = each.value.name
  resource_group_name  = var.network_rsg
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value.address_prefix]

  private_link_service_network_policies_enabled = false

  dynamic "delegation" {
    for_each = lookup(each.value, "delegate_to_containerapps", false) ? [1] : []
    content {
      name = "delegation"

      service_delegation {
        name = "Microsoft.App/environments"

        actions = [
          "Microsoft.Network/virtualNetworks/subnets/join/action"
        ]
      }
    }
  }
}

# -------------------------
# NSGs
# -------------------------
resource "azurerm_network_security_group" "nsg" {
  for_each = var.subnets

  name                = "nsg-${each.value.name}"
  location            = var.location
  resource_group_name = var.network_rsg
}

# # Allow VNet
# resource "azurerm_network_security_rule" "allow_vnet" {
#   for_each = var.subnets

#   name                       = "AllowVnetInBound"
#   priority                   = 200
#   direction                  = "Inbound"
#   access                     = "Allow"
#   protocol                   = "*"
#   source_address_prefix      = "VirtualNetwork"
#   destination_address_prefix = "VirtualNetwork"

#   resource_group_name         = var.network_rsg
#   network_security_group_name = azurerm_network_security_group.nsg[each.key].name
# }

# # Allow LB
# resource "azurerm_network_security_rule" "allow_lb" {
#   for_each = var.subnets

#   name                       = "AllowAzureLoadBalancerInBound"
#   priority                   = 300
#   direction                  = "Inbound"
#   access                     = "Allow"
#   protocol                   = "*"
#   source_address_prefix      = "AzureLoadBalancer"
#   destination_address_prefix = "*"

#   resource_group_name         = var.network_rsg
#   network_security_group_name = azurerm_network_security_group.nsg[each.key].name
# }

# # Deny inbound
# resource "azurerm_network_security_rule" "deny_inbound" {
#   for_each = var.subnets

#   name                       = "DenyAllInBound"
#   priority                   = 200
#   direction                  = "Inbound"
#   access                     = "Deny"
#   protocol                   = "*"
#   source_address_prefix      = "*"
#   destination_address_prefix = "*"

#   resource_group_name         = var.network_rsg
#   network_security_group_name = azurerm_network_security_group.nsg[each.key].name
# }

# # Outbound rules (Zero Trust)
# resource "azurerm_network_security_rule" "allow_vnet_out" {
#   for_each = var.subnets

#   name                       = "AllowVnetOutBound"
#   priority                   = 300
#   direction                  = "Outbound"
#   access                     = "Allow"
#   protocol                   = "*"
#   source_address_prefix      = "VirtualNetwork"
#   destination_address_prefix = "VirtualNetwork"

#   resource_group_name         = var.network_rsg
#   network_security_group_name = azurerm_network_security_group.nsg[each.key].name
# }

# resource "azurerm_network_security_rule" "deny_all_out" {
#   for_each = var.subnets

#   name                       = "DenyAllOutBound"
#   priority                   = 400
#   direction                  = "Outbound"
#   access                     = "Deny"
#   protocol                   = "*"
#   source_address_prefix      = "*"
#   destination_address_prefix = "*"

#   resource_group_name         = var.network_rsg
#   network_security_group_name = azurerm_network_security_group.nsg[each.key].name
# }

# -------------------------
# NSG ASSOCIATION
# -------------------------
resource "azurerm_subnet_network_security_group_association" "assoc" {
  for_each = var.subnets

  subnet_id                 = azurerm_subnet.subnets[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}

