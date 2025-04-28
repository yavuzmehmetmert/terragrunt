terraform {
  source = "../../modules/state"
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "azurerm" {
  subscription_id = "ef2ed8f5-4162-4bbd-9b47-e1c5ad825d25"
  features {}
}
EOF
}

inputs = {
  resource_group_name = "rg-terraform-state"
  location           = "northeurope"
  environment        = "state"
  container_name     = "tfstate"
} 