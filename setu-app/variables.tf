variable "region" {
  description = "AWS Resource Region"
  default = "us-east-1"
  type        = string
}

variable "product_name" {
  description = "AWS product_name"
  type        = string
}

variable "name" {
  description = "name"
  type        = string
}

variable "engine_rds" {
  default = "mysql"
}

variable "engine_rds_version" {
  default = "8.0.28"
}

variable "db_name" {
  default = "setu_app_details"
}

variable "username" {
}

variable "password" {
}

variable "env" {
  description = "AWS deployement"
  type        = string
}

variable "owner_value" {
  description = "Terraform"
  type        = string
}

variable "creator_value" {
  description = "Creator"
  type        = string
}


variable "bastion_instance_type" {
  default = "t2.micro"
  type = string
}
variable "key_name" {
  default = "setu_app_key"
  type = string
}
#variable "creator_value" {
#  description = "Terraform"
#  type        = string
#}


// VPC related variables

#variable "vpc_cidr_block" {
#  description = "Cidr block"
#  type        = string
#}

// Subnet related variables

#variable "subnet_availability_zone_a" {
#  description = "Availability zone a"
#  type        = string
#}
#
#variable "subnet_availability_zone_b" {
#  description = "Availability zone b"
#  type        = string
#}
#
#variable "public_subnet_cidr_block_a" {
#  description = "CIDR block zone a"
#  type        = string
#}
#
#variable "public_subnet_cidr_block_b" {
#  description = "CIDR block zone a"
#  type        = string
#}
#
#variable "private_subnet_cidr_block_a" {
#  description = "CIDR block zone a"
#  type        = string
#}
#
#variable "private_subnet_cidr_block_b" {
#  description = "CIDR block zone b"
#  type        = string
#}
#
#variable "database_subnet_cidr_block_a" {
#  description = "CIDR block zone a"
#  type        = string
#}
#
#variable "database_subnet_cidr_block_b" {
#  description = "CIDR block zone b"
#  type        = string
#}

