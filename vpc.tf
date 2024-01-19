
module "vpc" {
  source              = "terraform-aws-modules/vpc/aws"
  version             = "5.1.0"
  name                = "${var.prefix}vpc"
  cidr                = "10.0.0.0/16"
  azs                 = ["${var.region}a", "${var.region}b"]
  private_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets      = ["10.0.101.0/24", "10.0.102.0/24"]
  enable_nat_gateway  = false
  single_nat_gateway  = false
  enable_vpn_gateway  = false
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = "${var.prefix}rds-sg"
  description = "RDS MySQL security group"
  vpc_id      = module.vpc.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      description = "MySQL access from within VPC"
      cidr_blocks = module.vpc.vpc_cidr_block
    },
  ]

  tags = local.tags
}