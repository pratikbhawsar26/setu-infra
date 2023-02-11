####################################################################################
####                                                                            ####
####                                                                            ####
####                     Route association  (us-east-1)                         ####
####                                                                            ####
####                                                                            ####
####################################################################################

module "public_subnet_1_association" {
  source         = "git::https://github.com/pratikbhawsar26/setu-infra-modules//route_association?ref=v1.0.2"
  subnet_id      = module.public_subnet_1.subnet_id
  route_table_id = module.public_route_table.id
}

module "public_subnet_2_association" {
  source         = "git::https://github.com/pratikbhawsar26/setu-infra-modules//route_association?ref=v1.0.2"
  subnet_id      = module.public_subnet_2.subnet_id
  route_table_id = module.public_route_table.id
}

module "private_subnet_1_association" {
  source         = "git::https://github.com/pratikbhawsar26/setu-infra-modules//route_association?ref=v1.0.2"
  subnet_id      = module.private_subnet_1.subnet_id
  route_table_id = module.private_route_table_az_a.id
}

module "private_subnet_2_association" {
  source         = "git::https://github.com/pratikbhawsar26/setu-infra-modules//route_association?ref=v1.0.2"
  subnet_id      = module.private_subnet_2.subnet_id
  route_table_id = module.private_route_table_az_b.id
}

module "database_subnet_1_association" {
  source         = "git::https://github.com/pratikbhawsar26/setu-infra-modules//route_association?ref=v1.0.2"
  subnet_id      = module.database_subnet_1.subnet_id
  route_table_id = module.private_route_table_az_a.id
}

module "database_subnet_2_association" {
  source         = "git::https://github.com/pratikbhawsar26/setu-infra-modules//route_association?ref=v1.0.2"
  subnet_id      = module.database_subnet_2.subnet_id
  route_table_id = module.private_route_table_az_b.id
}