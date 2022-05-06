locals {

  role_purpose = {
    "task_iam_role"       = "ecstaskaccess",
    "task_execution_role" = "ecsclusteraccess"
  }
}

// sample1_task_defintion

module "sample1_task_defintion" {
  source                 = "../b2b-aws-modules/modules/ecs/task-definition/"
  appname_prefix         = "${var.domain}-${var.app_name.sample1}-${var.environment}"
  task_policy_suffix     = var.resource_suffix.task_policy_suffix
  dynamodb_suffix        = var.resource_suffix.dynamodb_suffix
  ecs_suffix             = var.resource_suffix.ecs_suffix
  cw_log_group_suffix    = var.resource_suffix.cw_log_group_suffix
  ecs_scope              = var.ecs_scope
  task_definition_suffix = var.resource_suffix.task_definition_suffix
  ecsclusteraccess_role  = local.role_purpose["task_execution_role"]
  ecstaskaccess_role     = local.role_purpose["task_iam_role"]
  aws_region             = var.aws_region
  common_tags            = local.common_tags
  container_cpu          = var.container_cpu
  container_memory       = var.container_memory
}


// sample2_task_defintion

module "sample2_task_defintion" {
  source                 = "../b2b-aws-modules/modules/ecs/task-definition/"
  appname_prefix         = "${var.domain}-${var.app_name.sample2}-${var.environment}"
  task_policy_suffix     = var.resource_suffix.task_policy_suffix
  dynamodb_suffix        = var.resource_suffix.dynamodb_suffix
  ecs_suffix             = var.resource_suffix.ecs_suffix
  cw_log_group_suffix    = var.resource_suffix.cw_log_group_suffix
  ecs_scope              = var.ecs_scope
  task_definition_suffix = var.resource_suffix.task_definition_suffix
  ecsclusteraccess_role  = local.role_purpose["task_execution_role"]
  ecstaskaccess_role     = local.role_purpose["task_iam_role"]
  aws_region             = var.aws_region
  common_tags            = local.common_tags
  container_cpu          = var.container_cpu
  container_memory       = var.container_memory
}

// sample3_task_defintion

module "sample3_task_defintion" {
  source                 = "../b2b-aws-modules/modules/ecs/task-definition/"
  appname_prefix         = "${var.domain}-${var.app_name.sample3}-${var.environment}"
  task_policy_suffix     = var.resource_suffix.task_policy_suffix
  dynamodb_suffix        = var.resource_suffix.dynamodb_suffix
  ecs_suffix             = var.resource_suffix.ecs_suffix
  cw_log_group_suffix    = var.resource_suffix.cw_log_group_suffix
  ecs_scope              = var.ecs_scope
  task_definition_suffix = var.resource_suffix.task_definition_suffix
  ecsclusteraccess_role  = local.role_purpose["task_execution_role"]
  ecstaskaccess_role     = local.role_purpose["task_iam_role"]
  aws_region             = var.aws_region
  common_tags            = local.common_tags
  container_cpu          = var.container_cpu
  container_memory       = var.container_memory
}

// sample4_task_defintion

module "sample4_task_defintion" {
  source                 = "../b2b-aws-modules/modules/ecs/task-definition/"
  appname_prefix         = "${var.domain}-${var.app_name.sample4}-${var.environment}"
  task_policy_suffix     = var.resource_suffix.task_policy_suffix
  dynamodb_suffix        = var.resource_suffix.dynamodb_suffix
  ecs_suffix             = var.resource_suffix.ecs_suffix
  cw_log_group_suffix    = var.resource_suffix.cw_log_group_suffix
  ecs_scope              = var.ecs_scope
  task_definition_suffix = var.resource_suffix.task_definition_suffix
  ecsclusteraccess_role  = local.role_purpose["task_execution_role"]
  ecstaskaccess_role     = local.role_purpose["task_iam_role"]
  aws_region             = var.aws_region
  common_tags            = local.common_tags
  container_cpu          = var.container_cpu
  container_memory       = var.container_memory
}

// sample5_task_defintion

module "sample5_task_defintion" {
  source                 = "../b2b-aws-modules/modules/ecs/task-definition/"
  appname_prefix         = "${var.domain}-${var.app_name.sample5}-${var.environment}"
  task_policy_suffix     = var.resource_suffix.task_policy_suffix
  dynamodb_suffix        = var.resource_suffix.dynamodb_suffix
  ecs_suffix             = var.resource_suffix.ecs_suffix
  cw_log_group_suffix    = var.resource_suffix.cw_log_group_suffix
  ecs_scope              = var.ecs_scope
  task_definition_suffix = var.resource_suffix.task_definition_suffix
  ecsclusteraccess_role  = local.role_purpose["task_execution_role"]
  ecstaskaccess_role     = local.role_purpose["task_iam_role"]
  aws_region             = var.aws_region
  common_tags            = local.common_tags
  container_cpu          = var.container_cpu
  container_memory       = var.container_memory
}
