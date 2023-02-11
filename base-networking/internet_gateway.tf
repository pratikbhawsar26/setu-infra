####################################################################################
####                                                                            ####
####                                                                            ####
####                  Internet Gateway   Virginia  (us-east-1)                  ####
####                                                                            ####
####                                                                            ####
####################################################################################

module "setu_app_internet_gateway" {
  source       = "git::https://github.com/pratikbhawsar26/setu-infra-modules//internet_gateway?ref=v1.0.1"
  product_name = var.product_name
  env          = var.env
  name         = "igw"
  vpc_id       = module.setu_app_vpc.vpc_id
  tags = merge(
    local.global_tags,
    {
      "Creator" : "pratikbhawsar26@gmail.com",
      "Owner" : "pratikbhawsar26@gmail.com",
    }
  )
}