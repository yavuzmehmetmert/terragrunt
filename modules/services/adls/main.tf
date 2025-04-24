terraform {
  backend "azurerm" {}
}

resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
  tags     = { environment = var.environment }
}

resource "azurerm_storage_account" "this" {
  name = "qaims20${replace(replace(var.resource_group_name, "rg", ""), "-", "")}"
  resource_group_name      = azurerm_resource_group.this.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = { environment = var.environment }
}