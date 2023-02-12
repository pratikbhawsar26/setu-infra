locals {
  name = "setu-app"
}

module "ecs_task_definition_setu_front_end" {
  source       = "git::https://github.com/pratikbhawsar26/setu-infra-modules//ecs_task_definition?ref=v1.0.10"
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
  image                    = "nginxdemos/hello:latest"
  container_name           = "setu-app"
  port                     = 80
  region                   = var.region

}


module "ecs_task_definition_setu_internal_svc_1" {
  source       = "git::https://github.com/pratikbhawsar26/setu-infra-modules//ecs_task_definition?ref=v1.0.10"
  name         = "${local.name}-svc-1"
  product_name = var.product_name
  env          = var.env
  family       = "${local.name}-task-internal-svc-1"
  # container_definitions         = ""
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  memory                   = "512"
  cpu                      = "256"
  execution_role_arn       = module.aws_iam_role_ecs_task_execution_role.role_arn
  task_role_arn            = module.aws_iam_role_ecs_task_execution_role.role_arn
  image                    = "nginxdemos/hello:latest"
  container_name           = "setu-internal-svc-1"
  port                     = 80
  region                   = var.region

}

module "ecs_task_definition_setu_internal_svc_2" {
  source       = "git::https://github.com/pratikbhawsar26/setu-infra-modules//ecs_task_definition?ref=v1.0.10"
  name         = "${local.name}-svc-2"
  product_name = var.product_name
  env          = var.env
  family       = "${local.name}-task-internal-svc-2"
  # container_definitions         = ""
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  memory                   = "512"
  cpu                      = "256"
  execution_role_arn       = module.aws_iam_role_ecs_task_execution_role.role_arn
  task_role_arn            = module.aws_iam_role_ecs_task_execution_role.role_arn
  image                    = "nginxdemos/hello:latest"
  container_name           = "setu-internal-svc-2"
  port                     = 80
  region                   = var.region

}
