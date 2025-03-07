# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used test
terraform {
  backend "azurerm" {
    resource_group_name  = "runner"
    storage_account_name = "nondairystate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate" # Name of the state file
    subscription_id = ${{ secrets.SUBSCRIPTION_ID }}
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
  subscription_id = ${{ secrets.SUBSCRIPTION_ID }}
  features {}
}

# Create a resource group
/*resource "azurerm_resource_group" "testing" {
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
*/
