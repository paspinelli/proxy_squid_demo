module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 3.0"

  identifier = "demodb"

  engine            = "mysql"
  engine_version    = "5.7.34"
  instance_class    = "db.t2.micro"
  allocated_storage = 20        
  #como minimo piden 20gb

  name     = "demodb"
  username = "user"
  password = "pepe2020"
  port     = "3306"

  iam_database_authentication_enabled = false

  vpc_security_group_ids = [module.rds_sg.security_group_id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  # DB subnet group
  subnet_ids = [module.vpc.database_subnets[0], module.vpc.database_subnets[1]]

  # DB parameter group
  family = "mysql5.7"

  # DB option group
  major_engine_version = "5.7"

  # Database Deletion Protection
  deletion_protection = false

}