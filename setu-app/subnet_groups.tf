
#module "rds_subnet_group" {
#  source                     = "git::ssh://git@github.com/LambdatestIncPrivate/sanrachna-module.git//db_subnet_group?ref=dev"
#  name                       = "${var.env}-${var.product_name}-sub-group"
#  product_name               = var.product_name
#  env                        = var.env
#  public_restricted_subnet_a = data.terraform_remote_state.networking_state.outputs.common_private_subnet_a_us_east_1
#  public_restricted_subnet_b = data.terraform_remote_state.networking_state.outputs.common_private_subnet_b_us_east_1
#  public_restricted_subnet_c = data.terraform_remote_state.networking_state.outputs.common_private_subnet_c_us_east_1
#  tags = merge({
#    Name        = "${var.product_name}-${var.env}-rds"
#    Environment = var.env
#    Product     = var.product_name
#    Owner       = var.owner_value
#    Creator     = var.creator_value
#  }, { "Creator" : "Terraform" })
#}



####################################################################################
####                                                                            ####
####                                                                            ####
####                           Europe subnet group id                           ####
####                                                                            ####
####                                                                            ####
####################################################################################

module "redis_subnet_group_europe" {
  providers = {
    aws = aws.en_central_region
  }
  source       = "git::ssh://git@github.com/LambdatestIncPrivate/sanrachna-module.git//elasticache_subnet_group?ref=v2.0.12"
  product_name = var.product_name
  env          = var.env
  name         = var.subnet_name_elasticache_europe_main
  subnets      = [data.terraform_remote_state.networking_state.outputs.common_private_subnet_a_region_eu_central_1, data.terraform_remote_state.networking_state.outputs.common_private_subnet_b_region_eu_central_1, data.terraform_remote_state.networking_state.outputs.common_private_subnet_c_region_eu_central_1]
  tags = {
    "${var.env_key}"          = var.env
    "${var.product_name_key}" = var.product_name
    "${var.creator_key}"      = var.creator_value
    "${var.owner_key}"        = var.owner_value
  }
}