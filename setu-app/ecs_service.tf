module "ecs_service_setu_front_end_app" {
  source                 = "git::https://github.com/pratikbhawsar26/setu-infra-modules//ecs_service?ref=v1.0.13"
  name                   = "setu-front-end"
  product_name           = var.product_name
  env                    = var.env
  cluster                = module.ecs_cluster.cluster_id
  task_definition        = module.ecs_task_definition_setu_front_end.family
  launch_type            = "FARGATE"
  scheduling_strategy    = "REPLICA"
  desired_count          = 2
  force_new_deployment   = true
  private_subnets         = [data.terraform_remote_state.networking_state.outputs.private_subnet_1 ,
                             data.terraform_remote_state.networking_state.outputs.private_subnet_2]
  service_security_group = module.security_group_ecs_service.security_group_id
  lb_security_group      = module.security_group_ecs_lb.security_group_id
  target_group_arn       = module.setu_front_end_target_group.tg_arn
  container_name         = "setu-app"
  container_port         = 80
#  depends_on             = [module.setu_app_listener]

}

module "ecs_service_setu_internal_svc_1" {
  source                 = "git::https://github.com/pratikbhawsar26/setu-infra-modules//ecs_service?ref=v1.0.13"
  name                   = "setu-internal-svc-1"
  product_name           = var.product_name
  env                    = var.env
  cluster                = module.ecs_cluster.cluster_id
  task_definition        = module.ecs_task_definition_setu_internal_svc_1.family
  launch_type            = "FARGATE"
  scheduling_strategy    = "REPLICA"
  desired_count          = 2
  force_new_deployment   = true
  private_subnets         = [data.terraform_remote_state.networking_state.outputs.private_subnet_1 ,
    data.terraform_remote_state.networking_state.outputs.private_subnet_2]
  service_security_group = module.security_group_ecs_service.security_group_id
  lb_security_group      = module.security_group_ecs_lb_internal.security_group_id
  target_group_arn       = module.setu_internal_svc_1_target_group.tg_arn
  container_name         = "setu-internal-svc-1"
  container_port         = 80
  #  depends_on             = [module.setu_app_listener]

}


module "ecs_service_setu_internal_svc_2" {
  source                 = "git::https://github.com/pratikbhawsar26/setu-infra-modules//ecs_service?ref=v1.0.13"
  name                   = "setu-internal-svc-2"
  product_name           = var.product_name
  env                    = var.env
  cluster                = module.ecs_cluster.cluster_id
  task_definition        = module.ecs_task_definition_setu_internal_svc_2.family
  launch_type            = "FARGATE"
  scheduling_strategy    = "REPLICA"
  desired_count          = 2
  force_new_deployment   = true
  private_subnets         = [data.terraform_remote_state.networking_state.outputs.private_subnet_1 ,
    data.terraform_remote_state.networking_state.outputs.private_subnet_2]
  service_security_group = module.security_group_ecs_service.security_group_id
  lb_security_group      = module.security_group_ecs_lb_internal.security_group_id
  target_group_arn       = module.setu_internal_svc_2_target_group.tg_arn
  container_name         = "setu-internal-svc-2"
  container_port         = 80
  #  depends_on             = [module.setu_app_listener]

}




