variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region where resources will be created"
}

variable "environment" {
  type        = string
  description = "Environment name (dev, test, prod)"
}
variable "subscription_id" {
  type = string
}