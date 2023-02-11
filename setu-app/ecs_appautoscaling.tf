module "ecs_appautoscaling_raven" {
  source             = "git::https://github.com/pratikbhawsar26/setu-infra-modules//ecs_appautoscaling?ref=v1.0.3"
  name               = "setu-app-autoscaling"
  product_name       = var.product_name
  env                = var.env
  max_capacity       = 2
  min_capacity       = 1
  resource_id        = "service/${module.ecs_cluster.cluster_id}/${module.ecs_service_raven.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

}