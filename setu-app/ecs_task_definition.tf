locals {
  name = "setu-app"
}

module "ecs_task_definition_raven" {
  source       = "git::https://github.com/pratikbhawsar26/setu-infra-modules//ecs_task_definition?ref=v1.0.3"
  name         = local.name
  product_name = var.product_name
  env          = var.env
  family       = "${local.name}-task"
  # container_definitions         = ""
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  memory                   = "512"
  cpu                      = "256"
  execution_role_arn       = module.aws_iam_role_ecs_task_execution_role.role_arn
  task_role_arn            = module.aws_iam_role_ecs_task_execution_role.role_arn
  image                    = "796715966878.dkr.ecr.us-east-1.amazonaws.com/lambda-raven:latest"
  container_name           = "setu"
  port                     = 80
  log_group                = module.cloudwatch_log_group_raven.group_name
  region                   = data.aws_region.current.name


}

data "aws_region" "current" {}