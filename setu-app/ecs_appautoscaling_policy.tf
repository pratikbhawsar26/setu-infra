module "ecs_appautoscaling_policy_setu_front_end_memory" {
  source                 = "git::https://github.com/pratikbhawsar26/setu-infra-modules//ecs_appautoscaling_policy?ref=v1.0.5"
  name                   = "setu-ecs-autoscaling-policy-memory"
  product_name           = var.product_name
  env                    = var.env
  policy_type            = "TargetTrackingScaling"
  resource_id            = module.ecs_appautoscaling_setu_front_end.resource_id
  scalable_dimension     = module.ecs_appautoscaling_setu_front_end.scalable_dimension
  service_namespace      = module.ecs_appautoscaling_setu_front_end.service_namespace
  predefined_metric_type = "ECSServiceAverageMemoryUtilization"
  target_value           = 80

}

module "ecs_appautoscaling_policy_setu_front_end_cpu" {
  source                 = "git::https://github.com/pratikbhawsar26/setu-infra-modules//ecs_appautoscaling_policy?ref=v1.0.5"
  name                   = "setu-ecs-autoscaling-policy-cpu"
  product_name           = var.product_name
  env                    = var.env
  policy_type            = "TargetTrackingScaling"
  resource_id            = module.ecs_appautoscaling_setu_front_end.resource_id
  scalable_dimension     = module.ecs_appautoscaling_setu_front_end.scalable_dimension
  service_namespace      = module.ecs_appautoscaling_setu_front_end.service_namespace
  predefined_metric_type = "ECSServiceAverageCPUUtilization"
  target_value           = 80

}