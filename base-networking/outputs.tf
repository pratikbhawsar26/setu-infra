output "setu_app_vpc" {
  value = module.setu_app_vpc.vpc_id
}

output "public_subnet_1" {
  value = module.public_subnet_1.subnet_id
}

output "public_subnet_2" {
  value = module.public_subnet_2.subnet_id
}

output "private_subnet_1" {
  value = module.private_subnet_1.subnet_id
}

output "private_subnet_2" {
  value = module.private_subnet_2.subnet_id
}

output "database_subnet_1" {
  value = module.database_subnet_1.subnet_id
}

output "database_subnet_2" {
  value = module.database_subnet_2.subnet_id
}

