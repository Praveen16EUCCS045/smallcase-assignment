locals {

  ecs_domain_naming_construct = "${var.domain}-${var.environment}-${var.aws_region}-${var.resource_suffix.cluster_suffix}"
}

module "ecs_cluster" {
  source                      = "../modules/ecs/cluster/"
  ecs_domain_naming_construct = local.ecs_domain_naming_construct
  common_tags                 = local.common_tags
}
