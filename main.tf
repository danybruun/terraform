# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used test
terraform {
  backend "azurerm" {}
  required_providers {
  azurerm = {
    source  = "hashicorp/azurerm"
    version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# Create a resource group
/*resource "azurerm_resource_group" "testing" {
  name     = "testing-${var.environment}"
  location = "norwayeast"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "testing" {
  name                = "testing-network-${var.environment}"
  resource_group_name = azurerm_resource_group.testing.name
  location            = azurerm_resource_group.testing.location
  address_space       = ["10.0.0.0/16"]
}
*/
