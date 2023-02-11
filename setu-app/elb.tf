module "raven_alb" {
  source                     = "git::https://github.com/pratikbhawsar26/setu-infra-modules//elb?ref=v1.0.4"
  name                       = "raven-alb"
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
  subnets = [data.terraform_remote_state.networking_state.outputs.common_public_all_access_subnet_a_us_east_1, data.terraform_remote_state.networking_state.outputs.common_public_all_access_subnet_b_us_east_1]
}