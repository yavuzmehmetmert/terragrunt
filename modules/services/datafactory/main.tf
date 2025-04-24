terraform {
  backend "azurerm" {}
}

resource "azurerm_data_factory" "this" {
  name                = "df-${var.environment}-${replace(var.resource_group_name, "rg-", "")}"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = { environment = var.environment }
}