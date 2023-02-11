module "security_group_ecs_lb" {
  source       = "git::https://github.com/pratikbhawsar26/setu-infra-modules//security_group?ref=v1.0.4"
  product_name = var.product_name
  name         = "ecs-elb-setu-app"
  env          = var.env
  tags = merge(
    local.global_tags,
    {
      "Creator" : "pratikbhawsar26@gmail.com",
      "Owner" : "pratikbhawsar26@gmail.com",
    }
  )
  vpc_id = data.terraform_remote_state.networking_state.outputs.vpc_id_us_east_1

  ingress_rules = [
    {
      from_port        = 80
      to_port          = 80
      type             = "ingress"
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      description      = "Allow all trafic to 80"
    },
    {
      from_port   = 443
      to_port     = 443
      type        = "ingress"
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

      description = "Allow all trafic to 443"
    }
  ]
  egress_rules = [
    {
      from_port        = 0
      to_port          = 0
      type             = "egress"
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      description      = "Allow all trafic"
    }
  ]
}


module "security_group_ecs_service" {
  source       = "git::https://github.com/pratikbhawsar26/setu-infra-modules//security_group?ref=v1.0.4"
  product_name = var.product_name
  name         = "ecs-service-raven"
  env          = var.env
  tags = merge(
    local.global_tags,
    {
      "Creator" : "pratikbhawsar26@gmail.com",
      "Owner" : "pratikbhawsar26@gmail.com",
    }
  )
  vpc_id = data.terraform_remote_state.networking_state.outputs.vpc_id_us_east_1

  ingress_rules = [
    {
      from_port   = 0
      to_port     = 0
      type        = "ingress"
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow all trafic to 0"
    }
  ]
  egress_rules = [
    {
      from_port        = 0
      to_port          = 0
      type             = "egress"
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      description      = "Allow all trafic"
    }
  ]
}