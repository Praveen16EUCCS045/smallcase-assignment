#SG for Lambda

module "main_sg" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "3.18.0"
  name        = "${var.domain}-${var.environment}-${var.aws_region}-${var.resource_suffix.lambda_suffix}-${var.resource_suffix.sg_suffix}"
  description = "Security group for flint b2b"
  vpc_id      = module.vpc.vpc_id

  # Inbound rules for security groups
  ingress_with_cidr_blocks = [
    {
      rule        = "https-443-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      rule        = "http-80-tcp"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  # Outbound rules for security groups
  egress_with_cidr_blocks = [
    {
      rule        = "all-all"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  tags = merge(local.common_tags,
    {
      Name = "${var.domain}-${var.environment}-${var.aws_region}-${var.resource_suffix.lambda_suffix}-${var.resource_suffix.sg_suffix}"
  })

}
 
