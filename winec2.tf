module "ec2_cluster123" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "winforsquid"
  instance_count         = 1

  ami                    = "ami-0b18ca1a93b538109"
  instance_type          = "t3.medium"
  key_name               = module.key_pair.key_pair_key_name
  monitoring             = false
  iam_instance_profile   = resource.aws_iam_instance_profile.role-instanceprofile.name
  vpc_security_group_ids = [module.service_sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[1]
  
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
