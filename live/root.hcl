# live/root.hcl

remote_state {
  backend = "azurerm"
  config = {
    resource_group_name   = "rg-terraform-state"
    storage_account_name  = "tfstatelive20250419"
    container_name        = "tfstate"
    key                   = "${path_relative_to_include()}.tfstate"
  }
}

locals {
  # Get the region from the current directory path
  region = basename(dirname(get_terragrunt_dir())) == "live" ? "" : basename(dirname(get_terragrunt_dir()))
  environment = basename(get_terragrunt_dir()) == "live" ? "" : basename(get_terragrunt_dir())

  # Region-specific settings
  subscription_map = {
    "emea"    = "ef2ed8f5-4162-4bbd-9b47-e1c5ad825d25"
    "america" = "064cf078-22df-47ed-a1de-0351c43ee216"
    "apac"    = "d03d9250-23ca-4c16-9a3a-5748c4420117" 
    }
  location_map = {
    "emea"    = "northeurope"
    "america" = "eastus"
    "apac"    = "southeastasia"
  }

  # Set provider and resource settings
  subscription_id = local.region == "" ? "" : local.subscription_map[local.region]
  location        = local.region == "" ? "" : local.location_map[local.region]
  resource_group_name = local.region == "" ? "" : "rg-${local.region}-${local.environment}"
}

# Expose local variables to child configurations
inputs = {
  subscription_id = local.subscription_id
  location = local.location
  resource_group_name = local.resource_group_name
  environment = local.environment
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}
EOF
} 