# live/emea/dev/terragrunt.hcl

include {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules/services"
}