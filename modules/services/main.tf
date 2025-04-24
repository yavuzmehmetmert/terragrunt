terraform {
  backend "azurerm" {}
}
module "adls" {
  source              = "./adls"
  resource_group_name = var.resource_group_name
  location            = var.location
  environment         = var.environment
  subscription_id     = var.subscription_id

}

module "datafactory" {
  source              = "./datafactory"
  resource_group_name = var.resource_group_name
  location            = var.location
  environment         = var.environment
  subscription_id     = var.subscription_id
  depends_on = [module.adls]
}