
module "setu_app_rds" {
  source              = "git::https://github.com/pratikbhawsar26/setu-infra-modules//rds?ref=v1.0.10"
  instance_class      = "db.t2.micro"
  name                = var.name
  product_name        = var.product_name
  env                 = var.env
  tags = merge(local.global_tags,
    {
      Owner   = var.owner_value
      Creator = var.creator_value
  })
  deletion_protection         = false
  skip_final_snapshot         = true
  allow_major_version_upgrade = false
  auto_minor_version_upgrade  = false
  final_snapshot_identifier   = ("${var.name}-snap")
  engine                      = var.engine_rds
  engine_version              = var.engine_rds_version
  family = "mysql8.0"
  storage_encrypted           = false
  db_name                     = var.db_name
  username                    = var.username
  password                    = var.password
  backup_window               = "00:00-03:00"
  maintenance_window          = "Fri:04:30-Fri:05:00"
  port                        = "3306"
  allocated_storage           = 20
  storage_type                = "gp2"
  vpc_security_group_ids      = [module.security_group_rds.security_group_id]
  db_subnet_group_name        = module.rds_subnet_group.subnet_group_id
  availability_zone           = null
  multi_az                    = true
  publicly_accessible         = false
  monitoring_interval         = 0
  backup_retention_period     = 7
  ca_cert_identifier          = "rds-ca-2019"
  parameter_group_name        = module.rds_parameter_group.name
}
