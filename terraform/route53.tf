resource "aws_route53_record" "xr_test" {
  zone_id = data.aws_route53_zone.toc_zone.zone_id
  name    = "xr-test.${data.aws_route53_zone.toc_zone.name}"
  type    = "A"
  alias {
    name                   = data.aws_lb.load_balancer.dns_name
    zone_id                = data.aws_lb.load_balancer.zone_id
    evaluate_target_health = false
  }
}

resource "aws_acm_certificate" "cert" {
  domain_name       = aws_route53_record.xr_test.name
  validation_method = "DNS"

  validation_option {
    domain_name       = aws_route53_record.xr_test.name
    validation_domain = data.aws_route53_zone.toc_zone.name
  }
  tags = local.common_tags
}

resource "aws_acm_certificate_validation" "cert_validation" {
  certificate_arn         = aws_acm_certificate.cert.arn
}

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = data.aws_lb.load_balancer.arn
  certificate_arn = aws_acm_certificate_validation.cert_validation.certificate_arn
  default_action {
    type = "forward"
    target_group_arn = var.lb_target_group_arn
  }
  port = 443
  protocol = "HTTPS"
}

