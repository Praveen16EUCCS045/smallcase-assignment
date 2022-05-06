variable "ecs_domain_naming_construct" {
  description = "ecs domain name"
  type        = string
}

variable "common_tags" {
  description = "Common tags"
  type        = map(any)
}
