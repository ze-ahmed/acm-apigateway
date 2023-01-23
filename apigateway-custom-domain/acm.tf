module "acm_module" {
  source             = "../acm-route53"
  AWS_REGION         = var.AWS_REGION
  root_domain_name   = var.root_domain_name
  root_domain_name-2 = var.root_domain_name-2
}
