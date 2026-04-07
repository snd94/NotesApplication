terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.57.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = ">= 1.12.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }

  backend "azurerm" {}
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
}

provider "azapi" {

}