# live/america/prod/terragrunt.hcl

include {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules/services/adls"
} 