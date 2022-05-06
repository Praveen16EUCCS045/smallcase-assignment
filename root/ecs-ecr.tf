//graphcms_ecr
module "graphcms_ecr" {
  source         = "../b2b-aws-modules/modules/ecs/ecr/"
  appname_prefix = "${var.domain}-${var.app_name.graph-cms}-${var.environment}-${var.resource_suffix.repository_suffix}"
  common_tags    = local.common_tags

}

//service-portal_ecr
module "service_portal_ecr" {
  source         = "../b2b-aws-modules/modules/ecs/ecr/"
  appname_prefix = "${var.domain}-${var.app_name.service-portal}-${var.environment}-${var.resource_suffix.repository_suffix}"
  common_tags    = local.common_tags

}

//sapc4c_ecr
module "sapc4c_ecr" {
  source         = "../b2b-aws-modules/modules/ecs/ecr/"
  appname_prefix = "${var.domain}-${var.app_name.sapc4c}-${var.environment}-${var.resource_suffix.repository_suffix}"
  common_tags    = local.common_tags

}

//sso-connector_ecr
module "sso_connector_ecr" {
  source         = "../b2b-aws-modules/modules/ecs/ecr/"
  appname_prefix = "${var.domain}-${var.app_name.sso-connector}-${var.environment}-${var.resource_suffix.repository_suffix}"
  common_tags    = local.common_tags

}

//sap-connector_ecr
module "sap_connector_ecr" {
  source         = "../b2b-aws-modules/modules/ecs/ecr/"
  appname_prefix = "${var.domain}-${var.app_name.sap-connector}-${var.environment}-${var.resource_suffix.repository_suffix}"
  common_tags    = local.common_tags

}