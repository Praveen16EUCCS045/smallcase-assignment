data "aws_route53_zone" "hosted_zone" {
  name         = var.domain_name_search
  private_zone = false
}

module "route53_record_cf_b2b_portal" {
  count   = var.environment == "prod" ? 0 : 1         // route 53 not only for prod
  source  = "clouddrove/route53-record/aws"
  version = "0.15.0"
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = local.alternative_domain
  type    = "A"
  alias = {
    name                   = module.b2b_portal.cloudfront_dns
    zone_id                = module.b2b_portal.cloudfront_hosted_zone_id
    evaluate_target_health = false
  }
}

module "route53_record_graphcms_api_gw" {
  source  = "clouddrove/route53-record/aws"
  version = "0.15.0"
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = module.b2b_graphcms_gateway.graphcms_custom_domain_name
  type    = "A"
  alias = {
    name                   = module.b2b_graphcms_gateway.graphcms_regional_domain_name
    zone_id                = module.b2b_graphcms_gateway.graphcms_regional_zone_id
    evaluate_target_health = false
  }
}

module "route53_record_sapc4c_api_gw" {
  source  = "clouddrove/route53-record/aws"
  version = "0.15.0"
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = module.b2b_sapc4c_gateway.sapc4c_custom_domain_name
  type    = "A"
  alias = {
    name                   = module.b2b_sapc4c_gateway.sapc4c_regional_domain_name
    zone_id                = module.b2b_sapc4c_gateway.sapc4c_regional_zone_id
    evaluate_target_health = false
  }
}

module "route53_record_service_portal_api_gw" {
  source  = "clouddrove/route53-record/aws"
  version = "0.15.0"
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = module.b2b_service_portal_gateway.service_portal_custom_domain_name
  type    = "A"
  alias = {
    name                   = module.b2b_service_portal_gateway.service_portal_regional_domain_name
    zone_id                = module.b2b_service_portal_gateway.service_portal_regional_zone_id
    evaluate_target_health = false
  }
}

module "route53_record_sso_connector_api_gw" {
  source  = "clouddrove/route53-record/aws"
  version = "0.15.0"
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = module.b2b_sso_connector_gateway.sso_connector_custom_domain_name
  type    = "A"
  alias = {
    name                   = module.b2b_sso_connector_gateway.sso_connector_regional_domain_name
    zone_id                = module.b2b_sso_connector_gateway.sso_connector_regional_zone_id
    evaluate_target_health = false
  }
}

module "route53_record_sap_connector_api_gw" {
  source  = "clouddrove/route53-record/aws"
  version = "0.15.0"
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = module.b2b_sap_connector_gateway.sap_custom_domain_name
  type    = "A"
  alias = {
    name                   = module.b2b_sap_connector_gateway.sap_regional_domain_name
    zone_id                = module.b2b_sap_connector_gateway.sap_regional_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "route_53_root_txt" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = ""
  type    = "TXT"
  ttl     = "300"
  records = [
    "v=spf1 include:amazonses.com -all"
  ]
}
