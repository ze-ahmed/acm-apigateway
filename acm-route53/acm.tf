# Internet Second certificate DNS validated

resource "aws_route53_zone" "my-api_zone" {
  name = var.root_domain_name
}

resource "aws_acm_certificate" "my-api_certificate" {
  domain_name       = var.root_domain_name
  validation_method = "DNS"
  lifecycle {
    create_before_destroy = true
  }
  validation_option {
    domain_name       = "api.${var.root_domain_name}"
    validation_domain = var.root_domain_name
  }

  tags = {
    #Bellow tag is removed to test the function
    #Chapter          = "PATRIMOINE"
    Tag2        = "a tag on acm certificate"
  }
}

resource "aws_route53_record" "my-api_cert_dns" {
  allow_overwrite = true
  name            = tolist(aws_acm_certificate.my-api_certificate.domain_validation_options)[0].resource_record_name
  records         = [tolist(aws_acm_certificate.my-api_certificate.domain_validation_options)[0].resource_record_value]
  type            = tolist(aws_acm_certificate.my-api_certificate.domain_validation_options)[0].resource_record_type
  zone_id         = aws_route53_zone.my-api_zone.zone_id
  ttl             = 60
}

resource "aws_acm_certificate_validation" "my-api_cert_validate" {
  certificate_arn         = aws_acm_certificate.my-api_certificate.arn
  validation_record_fqdns = [aws_route53_record.my-api_cert_dns.fqdn]
  #validation_record_fqdns = [for record in aws_route53_record.my-api_cert_dns : record.fqdn]
}




# Internet Second certificate email validated



resource "aws_route53_zone" "my-api_zone-2" {
  name = var.root_domain_name-2
}

resource "aws_acm_certificate" "my-api_certificate-2" {
  domain_name       = var.root_domain_name-2
  validation_method = "EMAIL"
  #wait_for_validation = false

  tags = {
    Tag1        = "a tag on acm certificate"
  }
}

resource "aws_route53_record" "my-api_cert_dns-2" {
  allow_overwrite = true
  name            = tolist(aws_acm_certificate.my-api_certificate-2.domain_validation_options)[0].resource_record_name
  records         = [tolist(aws_acm_certificate.my-api_certificate-2.domain_validation_options)[0].resource_record_value]
  type            = tolist(aws_acm_certificate.my-api_certificate-2.domain_validation_options)[0].resource_record_type
  zone_id         = aws_route53_zone.my-api_zone-2.zone_id
  ttl             = 60
}

resource "aws_acm_certificate_validation" "my-api_cert_validate-2" {
  certificate_arn         = aws_acm_certificate.my-api_certificate-2.arn
  validation_record_fqdns = [aws_route53_record.my-api_cert_dns-2.fqdn]
}