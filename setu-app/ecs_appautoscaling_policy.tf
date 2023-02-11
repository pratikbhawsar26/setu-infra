module "ecs_appautoscaling_policy_raven_memory" {
  source                 = "git::ssh://git@github.com/LambdatestIncPrivate/sanrachna-module.git//ecs_appautoscaling_policy?ref=v3.0.19"
  name                   = "raven-ecs-autoscaling-policy-memory"
  product_name           = var.product_name
  env                    = var.env
  policy_type            = "TargetTrackingScaling"
  resource_id            = module.ecs_appautoscaling_raven.resource_id
  scalable_dimension     = module.ecs_appautoscaling_raven.scalable_dimension
  service_namespace      = module.ecs_appautoscaling_raven.service_namespace
  predefined_metric_type = "ECSServiceAverageMemoryUtilization"
  target_value           = 80

}

module "ecs_appautoscaling_policy_raven_cpu" {
  source                 = "git::ssh://git@github.com/LambdatestIncPrivate/sanrachna-module.git//ecs_appautoscaling_policy?ref=v3.0.19"
  name                   = "raven-ecs-autoscaling-policy-cpu"
  product_name           = var.product_name
  env                    = var.env
  policy_type            = "TargetTrackingScaling"
  resource_id            = module.ecs_appautoscaling_raven.resource_id
  scalable_dimension     = module.ecs_appautoscaling_raven.scalable_dimension
  service_namespace      = module.ecs_appautoscaling_raven.service_namespace
  predefined_metric_type = "ECSServiceAverageCPUUtilization"
  target_value           = 80

}