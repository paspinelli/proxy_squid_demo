module "rds_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "sql_rds"
  description = "Security group for rds"
  vpc_id = module.vpc.vpc_id
  egress_rules = ["all-all"]
  ingress_with_source_security_group_id = [
    {
      from_port                = 3306
      to_port                  = 3306
      protocol                 = "tcp"
      description              = "for conection"
      source_security_group_id = module.service_sg.security_group_id
    },
  ]
}