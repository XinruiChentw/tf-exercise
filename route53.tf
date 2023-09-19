data "aws_route53_zone" "toc_zone" {
  zone_id = "Z20M894KO1IB4U"
  private_zone = true
}

resource "aws_route53_record" "xr_test" {
  zone_id = data.aws_route53_zone.toc_zone.zone_id
  name    = "xr-test.${data.aws_route53_zone.toc_zone.name}"
  type    = "A"
  ttl     = "300"
  records = ["16.162.206.11"]
}
