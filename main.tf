# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  backend "azurerm" {
    resource_group_name  = "terraform"
    storage_account_name = "nondairystate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate" # Name of the state file
  }
  required_providers {
  azurerm = {
    source  = "hashicorp/azurerm"
    version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "226f9a6d-884e-464e-a75a-8f55d46726c4"
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "testing" {
  name     = "testing"
  location = "norwayeast"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "testing" {
  name                = "testing-network"
  resource_group_name = azurerm_resource_group.testing.name
  location            = azurerm_resource_group.testing.location
  address_space       = ["10.0.0.0/16"]
}