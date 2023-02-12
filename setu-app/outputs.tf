output "setu_front_end_app_alb_url" {
  value = module.setu_front_end_app_alb.lb_dns_name
}

output "setu_internal_svc_alb" {
  value = module.setu_internal_svc_alb.lb_dns_name
}