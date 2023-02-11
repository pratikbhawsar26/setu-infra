module "ecs_cluster" {
  source       = "git::https://github.com/pratikbhawsar26/setu-infra-modules//ecs_cluster?ref=v1.0.2"
  name         = "raven-ecs"
  product_name = var.product_name
  env          = var.env

}