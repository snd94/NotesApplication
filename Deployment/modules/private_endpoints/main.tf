#############################################
# PRIVATE DNS ZONES
#############################################

resource "azurerm_private_dns_zone" "cosmos" {
  name                = "privatelink.documents.azure.com"
  resource_group_name = var.network_rsg
}

resource "azurerm_private_dns_zone" "search" {
  name                = "privatelink.search.windows.net"
  resource_group_name = var.network_rsg
}

resource "azurerm_private_dns_zone" "storage_blob" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = var.network_rsg
}

resource "azurerm_private_dns_zone" "cognitive" {
  name                = "privatelink.cognitiveservices.azure.com"
  resource_group_name = var.network_rsg
}

#############################################
# DNS ZONE LINKS
#############################################

# resource "azurerm_private_dns_zone_virtual_network_link" "cosmos_link" {
#   name                  = "cosmos-link"
#   resource_group_name   = var.network_rsg
#   private_dns_zone_name = azurerm_private_dns_zone.cosmos.name
#   virtual_network_id    = var.vnet_id
# }

resource "azurerm_private_dns_zone_virtual_network_link" "search_link" {
  name                  = "search-link"
  resource_group_name   = var.network_rsg
  private_dns_zone_name = azurerm_private_dns_zone.search.name
  virtual_network_id    = var.vnet_id
}

resource "azurerm_private_dns_zone_virtual_network_link" "storage_link" {
  name                  = "storage-link"
  resource_group_name   = var.network_rsg
  private_dns_zone_name = azurerm_private_dns_zone.storage_blob.name
  virtual_network_id    = var.vnet_id
}

resource "azurerm_private_dns_zone_virtual_network_link" "cognitive_link" {
  name                  = "cognitive-link"
  resource_group_name   = var.network_rsg
  private_dns_zone_name = azurerm_private_dns_zone.cognitive.name
  virtual_network_id    = var.vnet_id
}

#############################################
# COSMOS DB PRIVATE ENDPOINT
#############################################

# resource "azurerm_private_endpoint" "cosmos_pe" {
#   name                = "pe-cosmos"
#   location            = var.location
#   resource_group_name = var.network_rsg
#   subnet_id           = var.subnet_id

#   private_service_connection {
#     name                           = "cosmos-connection"
#     private_connection_resource_id = var.cosmosdb_account_id
#     subresource_names              = ["Sql"]
#     is_manual_connection           = false
#   }

#   # private_dns_zone_group {
#   #   name                 = "cosmos-dns-group"
#   #   private_dns_zone_ids = [azurerm_private_dns_zone.cosmos.id]
#   # }
# }

#############################################
# AZURE AI SEARCH PRIVATE ENDPOINT
#############################################

resource "azurerm_private_endpoint" "search_pe" {
  name                = "pe-search"
  location            = var.location
  resource_group_name = var.network_rsg
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "search-connection"
    private_connection_resource_id = var.search_service_id
    subresource_names              = ["searchService"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "search-dns-group"
    private_dns_zone_ids = [azurerm_private_dns_zone.search.id]
  }
}

#############################################
# STORAGE ACCOUNT (BLOB) PRIVATE ENDPOINT
#############################################

resource "azurerm_private_endpoint" "storage_blob_pe" {
  name                = "pe-storage-blob"
  location            = var.location
  resource_group_name = var.network_rsg
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "storage-connection"
    private_connection_resource_id = var.storage_account_id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "storage-dns-group"
    private_dns_zone_ids = [azurerm_private_dns_zone.storage_blob.id]
  }
}

#############################################
# AZURE AI FOUNDRY PRIVATE ENDPOINT
#############################################

resource "azurerm_private_endpoint" "cognitive_pe" {
  name                = "pe-aifoundry"
  location            = var.location
  resource_group_name = var.network_rsg
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "cognitive-connection"
    private_connection_resource_id = var.cognitive_account_id
    subresource_names              = ["account"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "cognitive-dns-group"
    private_dns_zone_ids = [azurerm_private_dns_zone.cognitive.id]
  }
}