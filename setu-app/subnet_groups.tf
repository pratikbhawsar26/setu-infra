
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
