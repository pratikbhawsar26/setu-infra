region            = "us-east-1"
product_name      = "fastag"
env               = "stage"

//tags
owner_value      = "pratikbhawsar26@gmail.com"
creator_value = "pratikbhawsar26@gmail.com"

// VPC related variables
vpc_cidr_block = "10.20.0.0/16"

// Subnet related variables
subnet_availability_zone_a = "us-east-1a"
subnet_availability_zone_b = "us-east-1b"

// Public Subnet CIDR
public_subnet_cidr_block_a = "10.20.1.0/24"
public_subnet_cidr_block_b = "10.20.2.0/24"


// Private Subnet CIDR
private_subnet_cidr_block_a = "10.20.3.0/24"
private_subnet_cidr_block_b = "10.20.4.0/24"


// Database Subnet CIDR
database_subnet_cidr_block_a = "10.20.5.0/24"
database_subnet_cidr_block_b = "10.20.6.0/24"