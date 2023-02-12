
module "rds_subnet_group" {
  source                      = "git::https://github.com/pratikbhawsar26/setu-infra-modules//db_subnet_group?ref=v1.0.14"
  name                        = "${var.env}-${var.product_name}-sub-group"
  product_name                = var.product_name
  env                         = var.env
  rds_private_subnet_a = data.terraform_remote_state.networking_state.outputs.database_subnet_1
  rds_private_subnet_b = data.terraform_remote_state.networking_state.outputs.database_subnet_2
  tags = merge({
    Name        = "${var.product_name}-${var.env}-rds"
    Environment = var.env
    Product     = var.product_name
    Owner       = var.owner_value
    Creator     = var.creator_value
  }, { "Creator" : "Terraform" })
}
