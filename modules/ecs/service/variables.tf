variable "appname_prefix" {
  description = "appname prefix"
  type        = string
}

variable "vpc_id" {
  description = "vpc id"
  type        = string
}

variable "ecs_cluster_name" {
  description = "ecs_cluster_name"
  type        = string
}
variable "ecs_task_definition_arn" {
  description = "ecs_task_definition_arn"
  type        = string

}

variable "ecs_cluster_id" {
  description = "ecs_cluster_id"
  type        = string
}

variable "private_subnets" {
  description = "private_subnets"
}

variable "alb_target_group_arn" {
  description = "alb_target_group_arn"
  type        = string

}

variable "sg_suffix" {
  type    = string
  default = "sg"
}

variable "task_suffix" {
  type    = string
  default = "task"
}

variable "task_policy_suffix" {
  type    = string
  default = "task-policy"
}

variable "container_suffix" {
  type    = string
  default = "container"
}

variable "task_definition_suffix" {
  type    = string
  default = "task-definition"
}

variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "dynamodb_suffix" {
  type    = string
  default = "dynamodb"
}

variable "s3_suffix" {
  type    = string
  default = "s3"
}

variable "ecs_scope" {
  type    = string
  default = "service"
}

variable "ecs_suffix" {
  type    = string
  default = "ecs"
}

variable "cw_log_group_suffix" {
  type    = string
  default = "cw-log-group"
}


variable "common_tags" {
  description = "Common tags"
  type        = map(any)
}

variable "container_port" {
  type        = number
  default     = "8000"
  description = "Port of container"
}


variable "service_desired_count" {
  type    = string
  default = "1"
}
