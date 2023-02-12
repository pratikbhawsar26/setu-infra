data "aws_iam_policy_document" "assume_role_policy_ecs_task_execution" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

module "aws_iam_role_ecs_task_execution_role" {
  source             = "git::https://github.com/pratikbhawsar26/setu-infra-modules//iam_roles?ref=v1.0.8"
  product_name       = var.product_name
  env                = var.env
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy_ecs_task_execution.json
  name               = "ecs-task-execution"
  tags = {
    "Environment"          = var.env
    "Product" = var.product_name
  }
}