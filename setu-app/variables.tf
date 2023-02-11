variable "region" {
  description = "AWS Resource Region"
  default = "us-east-1"
  type        = string
}

variable "product_name" {
  description = "AWS product_name"
  type        = string
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
  description = "Terraform"
  type        = string
}


// VPC related variables

variable "vpc_cidr_block" {
  description = "Cidr block"
  type        = string
}

// Subnet related variables

variable "subnet_availability_zone_a" {
  description = "Availability zone a"
  type        = string
}

variable "subnet_availability_zone_b" {
  description = "Availability zone b"
  type        = string
}

variable "public_subnet_cidr_block_a" {
  description = "CIDR block zone a"
  type        = string
}

variable "public_subnet_cidr_block_b" {
  description = "CIDR block zone a"
  type        = string
}

variable "private_subnet_cidr_block_a" {
  description = "CIDR block zone a"
  type        = string
}

variable "private_subnet_cidr_block_b" {
  description = "CIDR block zone b"
  type        = string
}

variable "database_subnet_cidr_block_a" {
  description = "CIDR block zone a"
  type        = string
}

variable "database_subnet_cidr_block_b" {
  description = "CIDR block zone b"
  type        = string
}

