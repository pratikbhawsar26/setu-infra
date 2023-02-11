

####################################################################################
####                                                                            ####
####                                                                            ####
####                 Route Tables    Virginia  (us-east-1)                      ####
####                                                                            ####
####                                                                            ####
####################################################################################

module "public_route_table" {
  source       = "git::https://github.com/pratikbhawsar26/setu-infra-modules//route_table?ref=v1.0.2"
  product_name = var.product_name
  env          = var.env
  name         = "public-route-table"
  vpc_id       = module.setu_app_vpc.vpc_id
  tags = merge(
    local.global_tags,
    {
      "Creator" : "pratikbhawsar26@gmail.com",
      "Owner" : "pratikbhawsar26@gmail.com",
    }
  )
}

module "private_route_table_az_a" {
  source       = "git::https://github.com/pratikbhawsar26/setu-infra-modules//route_table?ref=v1.0.2"
  product_name = var.product_name
  env          = var.env
  name         = "private-route-table-az-a"
  vpc_id       = module.setu_app_vpc.vpc_id
  tags = merge(
    local.global_tags,
    {
      "Creator" : "pratikbhawsar26@gmail.com",
      "Owner" : "pratikbhawsar26@gmail.com",
    }
  )
}

module "private_route_table_az_b" {
  source       = "git::https://github.com/pratikbhawsar26/setu-infra-modules//route_table?ref=v1.0.2"
  product_name = var.product_name
  env          = var.env
  name         = "private-route-table-az-b"
  vpc_id       = module.setu_app_vpc.vpc_id
  tags = merge(
    local.global_tags,
    {
      "Creator" : "pratikbhawsar26@gmail.com",
      "Owner" : "pratikbhawsar26@gmail.com",
    }
  )
}