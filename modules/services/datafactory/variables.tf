variable "resource_group_name" {
  type        = string
  description = "Storage Account'ın oluşturulacağı Resource Group"
}

variable "location" {
  type        = string
  description = "Kaynağın Azure bölgesi"
}

variable "environment" {
  type        = string
  description = "Ortam: dev/test/prod gibi"
}
variable "subscription_id" {
  type = string
}