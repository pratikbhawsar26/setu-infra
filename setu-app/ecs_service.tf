module "ecs_service_setu_app" {
  source                 = "git::https://github.com/pratikbhawsar26/setu-infra-modules//ecs_service?ref=v1.0.3"
  name                   = "raven-ecs-service"
  product_name           = var.product_name
  env                    = var.env
  cluster                = module.ecs_cluster.cluster_id
  task_definition        = module.ecs_task_definition_raven.family
  launch_type            = "FARGATE"
  scheduling_strategy    = "REPLICA"
  desired_count          = 1
  force_new_deployment   = true
  private_subnet         = data.terraform_remote_state.networking_state.outputs.common_private_subnet_a_us_east_1
  service_security_group = module.security_group_ecs_service.security_group_id
  lb_security_group      = module.security_group_ecs_lb.security_group_id
  target_group_arn       = module.raven_target_group.tg_id
  container_name         = "raven"
  container_port         = 80
  depends_on             = [module.raven_listener]

}



