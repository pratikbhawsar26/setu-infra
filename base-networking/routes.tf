####################################################################################
####                                                                            ####
####                                                                            ####
####           Routes for nat and internet gateway Virginia  (us-east-1)        ####
####                                                                            ####
####                                                                            ####
####################################################################################

module "nat_private_route_1" {
  source         = "git::https://github.com/pratikbhawsar26/setu-infra-modules//route/nat_gateway_routes?ref=v1.0.2"
  nat_gateway_id = module.nat_gateway_public_subnet_1.nat_gateway_id
  route_table_id = module.private_route_table_az_a.id
}

module "nat_private_route_2" {
  source         = "git::https://github.com/pratikbhawsar26/setu-infra-modules//route/nat_gateway_routes?ref=v1.0.2"
  nat_gateway_id = module.nat_gateway_public_subnet_2.nat_gateway_id
  route_table_id = module.private_route_table_az_b.id
}

module "igw_public_route" {
  source         = "git::https://github.com/pratikbhawsar26/setu-infra-modules//route/internet_gateway_routes?ref=v1.0.2"
  internet_gateway_id = module.setu_app_internet_gateway.internet_gateway_id
  route_table_id = module.public_route_table.id
}
