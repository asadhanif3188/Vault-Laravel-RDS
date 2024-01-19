output "database_subnet_group" {
  value = module.vpc.database_subnet_group
}

output "vpc_subnet_ids" {
  value = module.vpc.private_subnets
}
