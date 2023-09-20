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
