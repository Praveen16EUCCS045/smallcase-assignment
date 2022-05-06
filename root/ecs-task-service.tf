// sample1_service

module "sample1_service" {
  source                  = "../modules/ecs/service/"
  appname_prefix          = "${var.domain}-${var.app_name.sample1}-${var.environment}"
  vpc_id                  = module.vpc.vpc_id
  private_subnets         = module.vpc.private_subnets
  ecs_cluster_id          = module.ecs_cluster.cluster_id
  ecs_cluster_name        = module.ecs_cluster.cluster_name
  alb_target_group_arn    = module.graphcms_target_group_rule.alb_target_group_arn
  ecs_task_definition_arn = module.graphcms_task_defintion.ecs_task_definition_arn
  common_tags             = local.common_tags
  aws_region              = var.aws_region
}

// sample2_service

module "sample2_service" {
  source                  = "../modules/ecs/service/"
  appname_prefix          = "${var.domain}-${var.app_name.sample2}-${var.environment}"
  vpc_id                  = module.vpc.vpc_id
  private_subnets         = module.vpc.private_subnets
  ecs_cluster_id          = module.ecs_cluster.cluster_id
  ecs_cluster_name        = module.ecs_cluster.cluster_name
  alb_target_group_arn    = module.service_portal_target_group_rule.alb_target_group_arn
  ecs_task_definition_arn = module.service_portal_task_defintion.ecs_task_definition_arn
  common_tags             = local.common_tags
  aws_region              = var.aws_region
}

// sample3_service

module "sample3_service" {
  source                  = "../b2b-aws-modules/modules/ecs/service/"
  appname_prefix          = "${var.domain}-${var.app_name.sample3}-${var.environment}"
  vpc_id                  = module.vpc.vpc_id
  private_subnets         = module.vpc.private_subnets
  ecs_cluster_id          = module.ecs_cluster.cluster_id
  ecs_cluster_name        = module.ecs_cluster.cluster_name
  alb_target_group_arn    = module.sapc4c_target_group_rule.alb_target_group_arn
  ecs_task_definition_arn = module.sapc4c_task_defintion.ecs_task_definition_arn
  common_tags             = local.common_tags
  aws_region              = var.aws_region
}


// sample4_service

module "sample4_service" {
  source                  = "../modules/ecs/service/"
  appname_prefix          = "${var.domain}-${var.app_name.sample4}-${var.environment}"
  vpc_id                  = module.vpc.vpc_id
  private_subnets         = module.vpc.private_subnets
  ecs_cluster_id          = module.ecs_cluster.cluster_id
  ecs_cluster_name        = module.ecs_cluster.cluster_name
  alb_target_group_arn    = module.sso_connector_target_group_rule.alb_target_group_arn
  ecs_task_definition_arn = module.sso_connector_task_defintion.ecs_task_definition_arn
  common_tags             = local.common_tags
  aws_region              = var.aws_region
}

// sample5_service

module "sample5_service" {
  source                  = "../modules/ecs/service/"
  appname_prefix          = "${var.domain}-${var.app_name.sample5}-${var.environment}"
  vpc_id                  = module.vpc.vpc_id
  private_subnets         = module.vpc.private_subnets
  ecs_cluster_id          = module.ecs_cluster.cluster_id
  ecs_cluster_name        = module.ecs_cluster.cluster_name
  alb_target_group_arn    = module.sap_connector_target_group_rule.alb_target_group_arn
  ecs_task_definition_arn = module.sap_connector_task_defintion.ecs_task_definition_arn
  common_tags             = local.common_tags
  aws_region              = var.aws_region
}