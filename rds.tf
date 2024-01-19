/*
resource "random_password" "password" {
  length  = 16
  special = false
}

module "rds_mysql" {
  source              = "terraform-aws-modules/rds/aws"
  version             = "6.0.0"

  identifier          = "${var.prefix}rds-mysql"

  engine               = "mysql"
  engine_version       = "8.0"
  family               = "mysql8.0" # DB parameter group
  major_engine_version = "8.0"      # DB option group
  instance_class       = "db.t2.micro"

  storage_encrypted   = false
  allocated_storage   = 20  # Storage in GB
  
  username            = "admin"
  password            = random_password.password.result
  db_name             = "db"  # "mydatabase"

  multi_az            = false  # Set to true if you want a Multi-AZ deployment
  publicly_accessible = false  # Set to true if you want the database to be publicly accessible

  db_subnet_group_name   = module.vpc.database_subnet_group
  vpc_security_group_ids = [module.security_group.security_group_id]
  subnet_ids             = module.vpc.private_subnets

  apply_immediately   = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }

}
*/