module "public_subnet_1" {
  source                  = "git::https://github.com/pratikbhawsar26/setu-infra-modules//subnet?ref=v1.0.0"
  product_name            = var.product_name
  env                     = var.env
  name                    = "public-subnet-a"
  vpc_id                  = module.setu_app_vpc.vpc_id
  availability_zone       = var.subnet_availability_zone_a
  cidr_block              = var.public_subnet_cidr_block_a
  map_public_ip_on_launch = "false"
  tags = merge(
    local.global_tags,
    {
      "Creator" : "pratikbhawsar26@gmail.com",
      "Owner" : "pratikbhawsar26@gmail.com",
    }
  )
}

module "public_subnet_2" {
  source                  = "git::https://github.com/pratikbhawsar26/setu-infra-modules//subnet?ref=v1.0.0"
  product_name            = var.product_name
  env                     = var.env
  name                    = "public-subnet-b"
  vpc_id                  = module.setu_app_vpc.vpc_id
  availability_zone       = var.subnet_availability_zone_b
  cidr_block              = var.public_subnet_cidr_block_b
  map_public_ip_on_launch = "false"
  tags = merge(
    local.global_tags,
    {
      "Creator" : "pratikbhawsar26@gmail.com",
      "Owner" : "pratikbhawsar26@gmail.com",
    }
  )
}

module "private_subnet_1" {
  source                  = "git::https://github.com/pratikbhawsar26/setu-infra-modules//subnet?ref=v1.0.0"
  product_name            = var.product_name
  env                     = var.env
  name                    = "private-subnet-a"
  vpc_id                  = module.setu_app_vpc.vpc_id
  availability_zone       = var.subnet_availability_zone_a
  cidr_block              = var.private_subnet_cidr_block_a
  map_public_ip_on_launch = "false"
  tags = merge(
    local.global_tags,
    {
      "Creator" : "pratikbhawsar26@gmail.com",
      "Owner" : "pratikbhawsar26@gmail.com",
    }
  )
}

module "private_subnet_2" {
  source                  = "git::https://github.com/pratikbhawsar26/setu-infra-modules//subnet?ref=v1.0.0"
  product_name            = var.product_name
  env                     = var.env
  name                    = "private-subnet-b"
  vpc_id                  = module.setu_app_vpc.vpc_id
  availability_zone       = var.subnet_availability_zone_b
  cidr_block              = var.private_subnet_cidr_block_b
  map_public_ip_on_launch = "false"
  tags = merge(
    local.global_tags,
    {
      "Creator" : "pratikbhawsar26@gmail.com",
      "Owner" : "pratikbhawsar26@gmail.com",
    }
  )
}

module "database_subnet_1" {
  source                  = "git::https://github.com/pratikbhawsar26/setu-infra-modules//subnet?ref=v1.0.0"
  product_name            = var.product_name
  env                     = var.env
  name                    = "database-subnet-a"
  vpc_id                  = module.setu_app_vpc.vpc_id
  availability_zone       = var.subnet_availability_zone_a
  cidr_block              = var.database_subnet_cidr_block_a
  map_public_ip_on_launch = "false"
  tags = merge(
    local.global_tags,
    {
      "Creator" : "pratikbhawsar26@gmail.com",
      "Owner" : "pratikbhawsar26@gmail.com",
    }
  )
}

module "database_subnet_2" {
  source                  = "git::https://github.com/pratikbhawsar26/setu-infra-modules//subnet?ref=v1.0.0"
  product_name            = var.product_name
  env                     = var.env
  name                    = "database-subnet-b"
  vpc_id                  = module.setu_app_vpc.vpc_id
  availability_zone       = var.subnet_availability_zone_b
  cidr_block              = var.database_subnet_cidr_block_b
  map_public_ip_on_launch = "false"
  tags = merge(
    local.global_tags,
    {
      "Creator" : "pratikbhawsar26@gmail.com",
      "Owner" : "pratikbhawsar26@gmail.com",
    }
  )
}
