module "security_group_ecs_lb" {
  source       = "git::https://github.com/pratikbhawsar26/setu-infra-modules//security_group?ref=v1.0.6"
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
  vpc_id = data.terraform_remote_state.networking_state.outputs.setu_app_vpc

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

module "security_group_ecs_lb_internal" {
  source       = "git::https://github.com/pratikbhawsar26/setu-infra-modules//security_group?ref=v1.0.6"
  product_name = var.product_name
  name         = "ecs-elb-setu-internal-svc"
  env          = var.env
  tags = merge(
    local.global_tags,
    {
      "Creator" : "pratikbhawsar26@gmail.com",
      "Owner" : "pratikbhawsar26@gmail.com",
    }
  )
  vpc_id = data.terraform_remote_state.networking_state.outputs.setu_app_vpc

  ingress_rules = [
    {
      from_port        = 80
      to_port          = 80
      type             = "ingress"
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      description      = "Allow all trafic to 80"
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

module "security_group_ec2_bastion" {
  source       = "git::https://github.com/pratikbhawsar26/setu-infra-modules//security_group?ref=v1.0.6"
  product_name = var.product_name
  name         = "ec2-bastion-setu-app"
  env          = var.env
  tags = merge(
    local.global_tags,
    {
      "Creator" : "pratikbhawsar26@gmail.com",
      "Owner" : "pratikbhawsar26@gmail.com",
    }
  )
  vpc_id = data.terraform_remote_state.networking_state.outputs.setu_app_vpc

  ingress_rules = [
    {
      from_port   = 3389
      to_port     = 3389
      type        = "ingress"
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

      description = "Allow all trafic to 3389"
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
  source       = "git::https://github.com/pratikbhawsar26/setu-infra-modules//security_group?ref=v1.0.6"
  product_name = var.product_name
  name         = "ecs-service-setu"
  env          = var.env
  tags = merge(
    local.global_tags,
    {
      "Creator" : "pratikbhawsar26@gmail.com",
      "Owner" : "pratikbhawsar26@gmail.com",
    }
  )
  vpc_id = data.terraform_remote_state.networking_state.outputs.setu_app_vpc

  ingress_rules = [
    {
      from_port   = 80
      to_port     = 80
      type        = "ingress"
      protocol    = "tcp"
      security_groups = [module.security_group_ecs_lb.security_group_id]
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

module "security_group_rds" {
  source       = "git::https://github.com/pratikbhawsar26/setu-infra-modules//security_group?ref=v1.0.6"
  product_name = var.product_name
  name         = "rds-sg"
  env          = var.env
  tags = merge(
    local.global_tags,
    {
      "Creator" : "pratikbhawsar26@gmail.com",
      "Owner" : "pratikbhawsar26@gmail.com",
    }
  )
  vpc_id = data.terraform_remote_state.networking_state.outputs.setu_app_vpc

  ingress_rules = [
    {
      from_port   = 3306
      to_port     = 3306
      type        = "ingress"
      protocol    = "tcp"
      security_groups = [module.security_group_ecs_service.security_group_id, module.security_group_ec2_bastion.security_group_id]
      description = "Allow all trafic to 3306"
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