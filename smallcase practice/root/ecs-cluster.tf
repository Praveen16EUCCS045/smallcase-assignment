locals {

  ecs_domain_naming_construct = "${var.domain}-${var.environment}-${var.aws_region}-${var.resource_suffix.cluster_suffix}"
}

module "b2b_cluster" {
  source                      = "../b2b-aws-modules/modules/ecs/cluster/"
  ecs_domain_naming_construct = local.ecs_domain_naming_construct
  common_tags                 = local.common_tags
}
