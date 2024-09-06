# output "azs" {
#   value = module.vpc.azs
# }

output "vpc_id"{
  value=module.vpc.vpc_id
}

output "public_subnet_ids"{
  value=module.vpc.public_subnet_ids
}

output "private_subnet_ids"{
  value=module.vpc.private_subnet_ids
}


output "database_subnet_ids" {
  value = module.vpc.database_subnet_ids
}



output "db_subnet_group_id"{
  value=module.vpc.database_subnet_group_id
}

output "database_subnet_group_name" {
  value = module.vpc.database_subnet_group_name
}