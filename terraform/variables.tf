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
variable "vpc" {
  description = "vpc variables"
  type = object({
    vpc_name               = string
    vpc_cidr_block         = string
    vpc_availability_zones = list(string)
    vpc_public_subnets     = list(string)
    vpc_private_subnets    = list(string)
    vpc_enable_nat_gateway = bool
    vpc_single_nat_gateway = bool
  })
}

#---------EKS----------#
variable "eks" {
  description = ""
  type = object({
    cluster_name                   = string
    cluster_version                = string
    cluster_endpoint_public_access = bool
  })
}

variable "lb_sa_name" {}
variable "lb_target_group_arn" {}
