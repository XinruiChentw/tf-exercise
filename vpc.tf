module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name            = var.vpc.vpc_name
  cidr            = var.vpc.vpc_cidr_block
  azs             = var.vpc.vpc_availability_zones
  public_subnets  = var.vpc.vpc_public_subnets
  private_subnets = var.vpc.vpc_private_subnets

  enable_nat_gateway = var.vpc.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc.vpc_single_nat_gateway

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = local.common_tags
  public_subnet_tags  = { Type = "Public Subnets" }
  private_subnet_tags = { Type = "Private Subnets" }
}
