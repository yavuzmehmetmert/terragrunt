# live/emea/terragrunt.hcl

include {
  path = find_in_parent_folders("root.hcl")
}

# Region-specific configurations can be added here
locals {
  region = "emea"
  subscription_id = "ef2ed8f5-4162-4bbd-9b47-e1c5ad825d25"
  location = "northeurope"
  # Region-specific overrides can be defined here
} 