module "ecs_appautoscaling_setu_front_end" {
  source             = "git::https://github.com/pratikbhawsar26/setu-infra-modules//ecs_appautoscaling?ref=v1.0.3"
  name               = "setu-front-end-app-autoscaling"
  product_name       = var.product_name
  env                = var.env
  max_capacity       = 4
  min_capacity       = 2
  resource_id        = "service/${module.ecs_cluster.cluster_id}/${module.ecs_service_setu_front_end_app.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}