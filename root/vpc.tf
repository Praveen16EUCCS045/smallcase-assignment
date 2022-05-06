data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.78.0"
  name    = "${var.domain}-${var.environment}-${var.resource_suffix.vpc_suffix}"
  cidr    = var.cidr

  # Get availability_zones from data source
  azs = data.aws_availability_zones.available.names

  # Subnets
  public_subnets   = var.public_subnet_cidr
  private_subnets  = var.private_subnet_cidr
  database_subnets = var.database_subnet_cidr

  public_subnet_tags   = { "SubnetType" = "public" }
  private_subnet_tags  = { "SubnetType" = "private" }
  database_subnet_tags = { "SubnetType" = "database" }

  # Assigning Subnet Suffix values
  public_subnet_suffix   = "public-subnet"
  private_subnet_suffix  = "private-subnet"
  database_subnet_suffix = "db-subnet"

  # Enable DNS hostname
  enable_dns_hostnames = true
  enable_dns_support   = true

  # Create route table
  manage_default_route_table = true
  default_route_table_tags   = { DefaultRouteTable = true }

  # Create NAT gateway for private subnets
  enable_nat_gateway     = true
  one_nat_gateway_per_az = false
  igw_tags               = { "Name" = "${var.domain}-${var.environment}-${var.aws_region}-${var.resource_suffix.igw_suffix}" }

  # Disable RDS operation
  create_database_subnet_group = false

  # Default security group - ingress/egress rules cleared to deny all
  manage_default_security_group  = true
  default_security_group_ingress = []
  default_security_group_egress  = []

  # Create NACL for vpc
  default_network_acl_name   = "${var.domain}-${var.environment}-${var.aws_region}-${var.resource_suffix.vpc_suffix}-${var.resource_suffix.nacl_suffix}"
  manage_default_network_acl = true

  tags = local.common_tags

}
