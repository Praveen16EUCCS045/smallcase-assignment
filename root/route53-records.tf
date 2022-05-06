data "aws_route53_zone" "hosted_zone" {
  name         = var.domain_name_search
  private_zone = false
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = "www.smallcase.com"
  type    = "A"
  ttl     = "300"
  records = [
    "v=spf1 include:amazonses.com -all"
  ]
}
