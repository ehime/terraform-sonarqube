locals {
  tags = {
    terraform   = "true"
    environment = "example"
    application = "sonarqube"
  }
}

module "sonarqube" {
  source                 = "../../"
  prefix                 = "sonarqube"
  private_subnet_count   = "2"
  cluster_instance_type  = "t2.small"
  cluster_instance_count = "1"
  tags                   = "${local.tags}"
  parameters_key_arn     = "arn:aws:kms:eu-west-1:111122223333:key/12345678-1234-1234-1234-1234567890ab"
  certificate_arn        = "arn:aws:acm:eu-west-1:111122223333:certificate/12345678-1234-1234-1234-1234567890ab"
  route53_zone           = "example.com"
}
