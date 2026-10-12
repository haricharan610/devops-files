output "azz_info" {
    value = module.azz_info
  
}

output "vpc_id" {
    value = module.vpc.vpc_id
  
}

output "public_subnet_ids" {
    value = module.vpc.public_subnet_ids
  
}

output "private_subnet_ids" {
    value = module.vpc.private_subnet_ids
  
}

output "database_ids" {
    value = module.vpc.database_ids
  
}