#--------common-----------#
variable "aws_region" { default = "ap-east-1" }
variable "environment" { default = "dev" }

locals {
  common_tags = {
    Environment = "dev"
    Owner       = "Xinrui"
  }
}

#--------VPC-----------#
variable "vpc_name" { default = "xr-vpc" }
variable "vpc_cidr_block" { default = "10.0.0.0/16" }
variable "vpc_availability_zones" { default = ["ap-east-1a", "ap-east-1b"] }
variable "vpc_public_subnets" { default = ["10.0.101.0/24", "10.0.102.0/24"] }
variable "vpc_private_subnets" { default = ["10.0.1.0/24", "10.0.2.0/24"] }
variable "vpc_enable_nat_gateway" { default = true }
variable "vpc_single_nat_gateway" { default = true }
