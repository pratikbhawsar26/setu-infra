####################################################################################
####                                                                            ####
####                                                                            ####
####               Cloudwatch Logs for ECS                                      ####
####                                                                            ####
####                                                                            ####
####################################################################################

module "cloudwatch_log_group_raven" {
  source     = "git::https://github.com/pratikbhawsar26/setu-infra-modules//cloudwatch_log_groups?ref=v1.0.5"
  group_name = "setu/${var.product_name}/${var.env}"
  tags = merge(
    local.global_tags,
    {
      "Creator" : "pratikbhawsar26@gmail.com",
      "Owner" : "pratikbhawsar26@gmail.com",
    }
  )

}