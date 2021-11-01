module "vote_service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "proxy-sg"
  description = "Security group for proxysquid"
  vpc_id = module.vpc.vpc_id
  egress_rules = ["all-all"]
  ingress_with_source_security_group_id = [
    {
      from_port                = 3128
      to_port                  = 3128
      protocol                 = "tcp"
      description              = "for proxy"
      source_security_group_id = module.service_sg.security_group_id
    },
    {
      from_port                = 22
      to_port                   = 22
      protocol                 = "tcp"
      description              = "for proxy"
      source_security_group_id = module.service_sg.security_group_id
    }
  ]
}


  // vpc_id                   = xxxxxxxxxx
  // egress_rules             = ["all-all"]
  // ingress_with_source_security_group_id = [
  //   {
  //     from_port                = 3306
  //     to_port                  = 3306
  //     protocol                 = "tcp"
  //     description              = "AxxxxxxxS"
  //     source_security_group_id = dependency.ec2-sg.outputs.security_group_id
  //   }
  // ]









