module "setu_app_listener" {
  source                       = "git::https://github.com/pratikbhawsar26/setu-infra-modules//elb_listener?ref=v1.0.9"
  lb_arn                       = module.setu_front_end_app_alb.lb_id
  name                         = "lb-listener"
  http_listner_target_port     = 80
  http_listner_target_protocol = "HTTP"
  http_listner_action_type     = "forward"
  http_listner_tg_arn = module.setu_front_end_target_group.tg_arn
}


module "setu_internal_svc_listener" {
  source                       = "git::https://github.com/pratikbhawsar26/setu-infra-modules//elb_listener?ref=v1.0.9"
  lb_arn                       = module.setu_internal_svc_alb.lb_id
  name                         = "internal-svc-lb-listener"
  http_listner_target_port     = 80
  http_listner_target_protocol = "HTTP"
  http_listner_action_type     = "forward"
  http_listner_tg_arn = module.setu_internal_svc_1_target_group.tg_arn



}

module "setu_internal_svc_listener_rule_internal_svc_1" {
  source = "git::https://github.com/pratikbhawsar26/setu-infra-modules//elb_listener_rules?ref=v1.0.9"
  https_listener_arn = module.setu_internal_svc_listener.http_listener_id
  target_group_arn = module.setu_internal_svc_1_target_group.tg_arn
  priority = 100
  hostheader = ["internalsvc1.setu.com"]
  action_type = "forward"
}

module "setu_internal_svc_listener_rule_internal_svc_2" {
  source = "git::https://github.com/pratikbhawsar26/setu-infra-modules//elb_listener_rules?ref=v1.0.9"
  https_listener_arn = module.setu_internal_svc_listener.http_listener_id
  target_group_arn = module.setu_internal_svc_2_target_group.tg_arn
  priority = 101
  hostheader = ["internalsvc2.setu.com"]
  action_type = "forward"
}
#module "raven_listener" {
#  source                       = "git::ssh://git@github.com/LambdatestIncPrivate/sanrachna-module//elb_listener?ref=v2.0.58"
#  lb_arn                       = module.se.lb_id
#  name                         = "lb-listener"
#  http_listner_target_port     = 80
#  http_listner_target_protocol = "HTTP"
#  http_listner_action_type     = "redirect"
#
#  http_listner_redirection_protocol    = "HTTPS"
#  http_listner_redirection_port        = 443
#  http_listner_redirection_status_code = "HTTP_301"
#  http_listner_redirection_query       = "#{query}"
#
#  https_listner_target_port      = 443
#  https_listner_target_protocol  = "HTTPS"
#  https_listner_ssl_policy       = "ELBSecurityPolicy-2016-08"
#  https_listner_certificate_arn  = data.aws_acm_certificate.certificate.arn
#  https_listner_action           = "forward"
#  https_listner_target_group_arn = module.raven_target_group.tg_id
#}
