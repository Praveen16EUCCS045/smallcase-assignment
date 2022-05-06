variable "repository_name" {
  type    = string
  default = "gecko-services-basicrun"
}

variable "appname_prefix" {
  description = "appname prefix"
  type        = string
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
  default     = "3000"
  description = "Port of container"
}


variable "container_cpu" {
  type        = number
  default     = 512
  description = "The number of cpu units used by the task"
}

variable "container_memory" {
  type        = number
  default     = 1024
  description = "The amount (in MiB) of memory used by the task"
}

# container image
variable "container_image" {
  default     = "391058621050.dkr.ecr.eu-central-1.amazonaws.com/nginx:latest"
  description = "Docker image to be launched"
}

# application environment variables
variable "container_environment" {
  description = "The container environmnent variables"
  type = list(object({
    name  = string
    value = string
  }))
  default = [

  ]
}

variable "task_name" {
  type    = string
  default = "gecko-services-pilot-basicrun"
}

variable "service_desired_count" {
  type    = string
  default = "1"
}

# service health check path 
variable "health_check_path" {
  type    = string
  default = "/"
}

variable "iam_role_suffix" {
  type    = string
  default = "iam-role"
}

variable "ecsclusteraccess_role" {
  type = string
}

variable "ecstaskaccess_role" {
  type = string
}

# ECS task role cognito access required 
variable "ecs_task_role_cognito_required" {
  description = "ECS task requires cognito access or not"
  type        = bool
  default     = false
}

variable "ecs_task_role_eventbridge_required" {
  description = "ECS task requires eventbridge access or not"
  type        = bool
  default     = false
}
