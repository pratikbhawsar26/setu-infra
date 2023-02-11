####################################################################################
####                                                                            ####
####                                                                            ####
####                    VPC for the app/product                                 ####
####                                                                            ####
####                                                                            ####
####################################################################################

module "setu_app_vpc" {
  source       = "git::https://github.com/pratikbhawsar26/setu-infra-modules//vpc?ref=v1.0.0"
  product_name = var.product_name
  env          = var.env
  name         = "vpc"
  cidr_block   = var.vpc_cidr_block
  tags = merge(
    local.global_tags,
    {
      "Creator" : "pratikbhawsar26@gmail.com",
      "Owner" : "pratikbhawsar26@gmail.com",
    }
  )
}