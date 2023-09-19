vpc = {
  vpc_name               = "xr-vpc"
  vpc_cidr_block         = "10.0.0.0/16"
  vpc_availability_zones = ["ap-east-1a", "ap-east-1b"]
  vpc_public_subnets     = ["10.0.101.0/24", "10.0.102.0/24"]
  vpc_private_subnets    = ["10.0.1.0/24", "10.0.2.0/24"]
  vpc_enable_nat_gateway = true
  vpc_single_nat_gateway = true
}

eks = {
  cluster_name = "xr-test"
  cluster_version                = "1.27"
  cluster_endpoint_public_access = true
  aws_auth_roles = [
    {
      rolearn = "arn:aws:iam::494526681395:role/xr-eks-cluster-role"
    }
  ]
}
