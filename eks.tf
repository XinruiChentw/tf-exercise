module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name                   = var.eks.cluster_name
  cluster_version                = var.eks.cluster_version
  cluster_endpoint_public_access = var.eks.cluster_endpoint_public_access

  cluster_addons = {
    kube-proxy = { most_recent = true }
    vpc-cni    = { most_recent = true }
    coredns = {
      configuration_values = jsonencode({
        replicaCount = 1
        computeType = "Fargate"
      })
    }
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  fargate_profiles = {
    default = {
      name      = "default"
      selectors = [{ namespace = "default" }]
    },
    kube-external-dns = {
      name      = "kube-external-dns"
      selectors = [{ namespace = "kube-external-dns" }]
    },
    kube-system = {
      name      = "kube-system"
      selectors = [{ namespace = "kube-system" }]
    }
  }
  aws_auth_roles = var.eks.aws_auth_roles
  tags = local.common_tags
}
