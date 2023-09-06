# Configure the Azure provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "my-resource-group"
  location = "West Europe"
}

# Create a storage account
resource "azurerm_storage_account" "example" {
  name                     = "01mystorageaccount"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "Production"
  }
}

# Output the storage account connection string
output "connection_string" {
  value = azurerm_storage_account.example.primary_connection_string
}
