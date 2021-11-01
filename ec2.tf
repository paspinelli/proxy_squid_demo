module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "proxysquid"
  instance_count         = 1

  ami                    = "ami-0747bdcabd34c712a"
  instance_type          = "t2.micro"
  key_name               = module.key_pair.key_pair_key_name
  monitoring             = false
  vpc_security_group_ids = [module.vote_service_sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[1]
  iam_instance_profile   = resource.aws_iam_instance_profile.role-instanceprofile.name
  user_data              = <<-EOF
              #!/bin/bash
              // sudo su
              apt-get update  #el -y para que sea desatendido
              apt-get install squid -y
            EOF 

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
