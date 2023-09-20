resource "helm_release" "load_balancer_controller" {
  name       = "aws-load-balancer-controller"
  namespace = "kube-system"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"

  set {
    name  = "service.type"
    value = "ClusterIP"
  }
  set {
  name  = "region"
  value = var.aws_region
  }
  set {
    name  = "vpcId"
    value = module.vpc.vpc_id
  }
  set {
    name  = "clusterName"
    value = module.eks.cluster_name
  }
  set {
    name  = "serviceAccount.create"
    value = "false"
  }
  set {
    name  = "serviceAccount.name"
    value = var.lb_sa_name
  }
  set {
    name  = "replicaCount"
    value = 1
  }
}

resource "helm_release" "simple-nginx" {
  name  = "simple-nginx"
  repository = "../helm"
  chart = "simple-nginx"
  namespace = "default"
}
