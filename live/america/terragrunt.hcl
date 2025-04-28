# live/america/terragrunt.hcl

include {
  path = find_in_parent_folders("root.hcl")
}

locals {
  region = "america"
  subscription_id = "064cf078-22df-47ed-a1de-0351c43ee216"
  location = "eastus"
} 