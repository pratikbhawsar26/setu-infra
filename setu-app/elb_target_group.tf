module "raven_target_group" {
  source       = "git::https://github.com/pratikbhawsar26/setu-infra-modules//elb_target_group?ref=v1.0.4"
  name         = "setu-app-tg"
  product_name = var.product_name
  env          = var.env
  port         = 80
  target_type  = "ip"
  protocol     = "HTTP"
  vpc_id       = data.terraform_remote_state.networking_state.outputs.vpc_id_us_east_1
  tags = merge(
    local.global_tags,
    local.additional_tags,
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