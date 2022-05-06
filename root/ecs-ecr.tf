//sample1_ecr
module "sample1_ecr" {
  source         = "../modules/ecs/ecr/"
  appname_prefix = "${var.domain}-${var.app_name.graph-cms}-${var.environment}-${var.resource_suffix.repository_suffix}"
  common_tags    = local.common_tags

}

//sample2_ecr
module "sample2_ecr" {
  source         = "../modules/ecs/ecr/"
  appname_prefix = "${var.domain}-${var.app_name.service-portal}-${var.environment}-${var.resource_suffix.repository_suffix}"
  common_tags    = local.common_tags

}

//sample3_ecr
module "sample3_ecr" {
  source         = "../modules/ecs/ecr/"
  appname_prefix = "${var.domain}-${var.app_name.sapc4c}-${var.environment}-${var.resource_suffix.repository_suffix}"
  common_tags    = local.common_tags

}

//sample4_ecr
module "sample4_ecr" {
  source         = "../modules/ecs/ecr/"
  appname_prefix = "${var.domain}-${var.app_name.sso-connector}-${var.environment}-${var.resource_suffix.repository_suffix}"
  common_tags    = local.common_tags

}

//sample5_ecr
module "sample5_ecr" {
  source         = "../modules/ecs/ecr/"
  appname_prefix = "${var.domain}-${var.app_name.sap-connector}-${var.environment}-${var.resource_suffix.repository_suffix}"
  common_tags    = local.common_tags

}