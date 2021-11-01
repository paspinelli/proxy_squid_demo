module "service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "winforsquid"
  description = "Security group for win"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "rdp-tcp"]
  egress_rules        = ["all-all"]

}