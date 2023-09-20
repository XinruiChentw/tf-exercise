data "aws_route53_zone" "toc_zone" {
  zone_id = "Z20M894KO1IB4U"
  private_zone = true
}

data "aws_lb" "load_balancer" {
  name = "k8s-default-simpleng-c2761cfcd5"
}
