module "setu_front_end_target_group" {
  source       = "git::https://github.com/pratikbhawsar26/setu-infra-modules//elb_target_group?ref=v1.0.8"
  name         = "setu-pub-app-tg"
  product_name = var.product_name
  env          = var.env
  port         = 80
  target_type  = "ip"
  protocol     = "HTTP"
  vpc_id       = data.terraform_remote_state.networking_state.outputs.setu_app_vpc
  tags = merge(
    local.global_tags,
    {
      "Creator" : "pratikbhawsar26@gmail.com",
      "Owner" : "pratikbhawsar26@gmail.com",
    }
  )

  target_health_check = [
    {
      enabled             = true
      healthy_threshold   = "3"
      interval            = "300"
      protocol            = "HTTP"
      path                = "/health"
      unhealthy_threshold = "2"
      port                = 80

    }
  ]
}

module "setu_internal_svc_1_target_group" {
  source       = "git::https://github.com/pratikbhawsar26/setu-infra-modules//elb_target_group?ref=v1.0.8"
  name         = "int-svc-1-tg"
  product_name = var.product_name
  env          = var.env
  port         = 80
  target_type  = "ip"
  protocol     = "HTTP"
  vpc_id       = data.terraform_remote_state.networking_state.outputs.setu_app_vpc
  tags = merge(
    local.global_tags,
    {
      "Creator" : "pratikbhawsar26@gmail.com",
      "Owner" : "pratikbhawsar26@gmail.com",
    }
  )

  target_health_check = [
    {
      enabled             = true
      healthy_threshold   = "3"
      interval            = "300"
      protocol            = "HTTP"
      path                = "/health"
      unhealthy_threshold = "2"
      port                = 80

    }
  ]
}

module "setu_internal_svc_2_target_group" {
  source       = "git::https://github.com/pratikbhawsar26/setu-infra-modules//elb_target_group?ref=v1.0.8"
  name         = "int-svc-2-tg"
  product_name = var.product_name
  env          = var.env
  port         = 80
  target_type  = "ip"
  protocol     = "HTTP"
  vpc_id       = data.terraform_remote_state.networking_state.outputs.setu_app_vpc
  tags = merge(
    local.global_tags,
    {
      "Creator" : "pratikbhawsar26@gmail.com",
      "Owner" : "pratikbhawsar26@gmail.com",
    }
  )

  target_health_check = [
    {
      enabled             = true
      healthy_threshold   = "3"
      interval            = "300"
      protocol            = "HTTP"
      path                = "/health"
      unhealthy_threshold = "2"
      port                = 80

    }
  ]
}