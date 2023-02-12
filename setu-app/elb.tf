module "setu_front_end_app_alb" {
  source                     = "git::https://github.com/pratikbhawsar26/setu-infra-modules//elb?ref=v1.0.8"
  name                       = "front-end-alb"
  product_name               = var.product_name
  env                        = var.env
  internal                   = "false"
  load_balancer_type         = "application"
  security_groups            = [module.security_group_ecs_lb.security_group_id]
  enable_deletion_protection = "false"
  idle_timeout               = 60
  tags = merge(
    local.global_tags,
    {
      "Creator" : "pratikbhawsar26@gmail.com",
      "Owner" : "pratikbhawsar26@gmail.com"
    }
  )
  subnets = [data.terraform_remote_state.networking_state.outputs.public_subnet_1, data.terraform_remote_state.networking_state.outputs.public_subnet_2]
}

module "setu_internal_svc_alb" {
  source                     = "git::https://github.com/pratikbhawsar26/setu-infra-modules//elb?ref=v1.0.8"
  name                       = "internal-svc-alb"
  product_name               = var.product_name
  env                        = var.env
  internal                   = "true"
  load_balancer_type         = "application"
  security_groups            = [module.security_group_ecs_lb_internal.security_group_id]
  enable_deletion_protection = "false"
  idle_timeout               = 60
  tags = merge(
    local.global_tags,
    {
      "Creator" : "pratikbhawsar26@gmail.com",
      "Owner" : "pratikbhawsar26@gmail.com"
    }
  )
  subnets = [data.terraform_remote_state.networking_state.outputs.private_subnet_1, data.terraform_remote_state.networking_state.outputs.private_subnet_2]
}


