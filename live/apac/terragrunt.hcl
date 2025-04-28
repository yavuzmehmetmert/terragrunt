# live/apac/terragrunt.hcl

include {
  path = find_in_parent_folders("root.hcl")
}

locals {
  region = "apac"
  subscription_id = "d03d9250-23ca-4c16-9a3a-5748c4420117"
  location = "southeastasia"
} 