module "setu_app_listener" {
  source                       = "git::https://github.com/pratikbhawsar26/setu-infra-modules//elb_listener?ref=v1.0.4"
  lb_arn                       = module.raven_alb.lb_id
  name                         = "lb-listener"
  http_listner_target_port     = 80
  http_listner_target_protocol = "HTTP"
  http_listner_action_type     = "redirect"

  http_listner_redirection_protocol    = "HTTPS"
  http_listner_redirection_port        = 443
  http_listner_redirection_status_code = "HTTP_301"
  http_listner_redirection_query       = "#{query}"

  https_listner_target_port      = 443
  https_listner_target_protocol  = "HTTPS"
  https_listner_ssl_policy       = "ELBSecurityPolicy-2016-08"
  https_listner_certificate_arn  = data.aws_acm_certificate.certificate.arn
  https_listner_action           = "forward"
  https_listner_target_group_arn = module.raven_target_group.tg_id
}
