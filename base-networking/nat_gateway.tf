####################################################################################
####                                                                            ####
####                                                                            ####
####                   Nat Gateway  Virginia  (us-east-1)                       ####
####                                                                            ####
####                                                                            ####
####################################################################################

module "nat_gateway_public_subnet_1" {
  source        = "git::https://github.com/pratikbhawsar26/setu-infra-modules//nat_gateway?ref=v1.0.0"
  product_name  = var.product_name
  env           = var.env
  name          = "nat-gateway-az-a"
  public_subnet = module.public_subnet_1.subnet_id
  tags = merge(
    local.global_tags,
    {
      "Creator" : "pratikbhawsar26@gmail.com",
      "Owner" : "pratikbhawsar26@gmail.com",
    }
  )
}

module "nat_gateway_public_subnet_2" {
  source        = "git::https://github.com/pratikbhawsar26/setu-infra-modules//nat_gateway?ref=v1.0.0"
  product_name  = var.product_name
  env           = var.env
  name          = "nat-gateway-az-b"
  public_subnet = module.public_subnet_2.subnet_id
  tags = merge(
    local.global_tags,
    {
      "Creator" : "pratikbhawsar26@gmail.com",
      "Owner" : "pratikbhawsar26@gmail.com",
    }
  )
}