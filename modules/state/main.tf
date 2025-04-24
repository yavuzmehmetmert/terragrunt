resource "azurerm_resource_group" "this" {
  name     = "rg-terraform-state"
  location = "westeurope"

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_storage_account" "this" {
  name                     = "tfstatelive20250419"
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_storage_container" "this" {
  name                  = "tfstate"
  storage_account_name = azurerm_storage_account.this.name
  container_access_type = "private"

  lifecycle {
    prevent_destroy = true
  }
}