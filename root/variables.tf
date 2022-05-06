####################################################################
# Common central variable
####################################################################
variable "aws_region" {
  type = string
}

variable "environment" {
  type = string
}

variable "domain" {
  type = string
}

variable "force_destroy" {
  description = "For setting up value of force destroy attribute for s3 bucket"
  type        = bool
}

####################################################################
# Miscelleneous variable suffix
####################################################################

variable "resource_suffix" {
  description = "map of resource suffix"
  type        = map(any)
  default = {

    "vpc_suffix"                  = "vpc",
    "nacl_suffix"                 = "nacl",
    "igw_suffix"                  = "igw",
    "ecs_suffix"                  = "ecs",
    "alb_suffix"                  = "alb",
    "nlb_suffix"                  = "nlb",
    "service_suffix"              = "service",
    "tg_suffix"                   = "tg",
    "repository_suffix"           = "repository",
    "task_policy_suffix"          = "task-policy",
    "task_definition_suffix"      = "task-definition",
    "endpoint_suffix"             = "endpoint",
    "bucket_suffix"               = "bucket",
    "lambda_suffix"               = "lf",
    "sg_suffix"                   = "sg",
    "cluster_suffix"              = "cluster"

  }
}

variable "app_name" {
  description = "map of app names"
  type        = map(any)
  default = {
    "sample1"         = "sample1",
    "sample2"         = "sample2",
    "sample3"         = "sample3",
    "sample4"         = "sample4",
    "sample5"         = "sample5",
  }
}


#####################################################################
# ecs-alb variables
#####################################################################

variable "tg_rule_priority" {
  description = "Priority for target groups"
  type        = map(any)
  default = {
    "graphcms_target_group_rule"       = 90,
    "service_portal_target_group_rule" = 91,
    "sapc4c_target_group_rule"         = 92,
    "ssoconnector_target_group_rule"   = 93,
    "sapconnector_target_group_rule"   = 94

  }
}

variable "alb_internal" {
  description = "Define value of alb_internal argument"
  type        = bool
  default     = true
}

#####################################################################
# ecs-nlb varaibles
#####################################################################

variable "health_check_path" {
  type    = string
  default = "/health"
}

#####################################################################
# ecs-task-definition variables
#####################################################################

variable "ecs_scope" {
  type    = string
  default = "service"
}

variable "container_cpu" {
  type = number
}

variable "container_memory" {
  type = number
}

####################################################################
# VPC variable
####################################################################

variable "cidr" {
  type = string
}

variable "public_subnet_cidr" {
  type        = list(string)
  description = "public subnet cidr"
}

variable "private_subnet_cidr" {
  type        = list(string)
  description = "private subnet cidr"
}

variable "database_subnet_cidr" {
  type        = list(string)
  description = "database subnet cidr"
}


variable "lambda_initialization_file" {
  description = "Source code file for lambda function initialization"
  type        = string
  default     = "lambda-initialization.zip"
}
