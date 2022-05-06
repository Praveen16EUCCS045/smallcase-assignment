module "b2b_alb" {
  source      = "../modules/elb/"
  domain_name = var.domain
  alb_suffix  = var.resource_suffix.alb_suffix
  common_tags = local.common_tags
  subnet_id   = module.vpc.private_subnets
  vpc_id      = module.vpc.vpc_id
  environment = var.environment


  alb_sg_name  = var.domain
  alb_internal = var.alb_internal

}
