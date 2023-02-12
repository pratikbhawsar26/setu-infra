module "rds_parameter_group" {
  source       = "git::https://github.com/pratikbhawsar26/setu-infra-modules//db_parameter_group?ref=v1.0.14"
  name         = "${var.env}-${var.product_name}-param-group"
  product_name = var.product_name
  env          = var.env
  family       = "mysql8.0"
  tags = merge({
    Name        = "${var.env}-${var.product_name}-param-group"
    Environment = var.env
    Product     = var.product_name
    Owner       = var.owner_value
    Creator     = var.creator_value
  }, { "creator" : "Terraform" })
  parameters = []
}