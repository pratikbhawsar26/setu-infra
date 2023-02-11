module "ecs_cluster" {
  source       = "git::https://github.com/pratikbhawsar26/setu-infra-modules//ecs_cluster?ref=v1.0.3"
  name         = "setu-app-ecs"
  product_name = var.product_name
  env          = var.env
}
