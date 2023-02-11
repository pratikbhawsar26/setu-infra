region            = "us-east-1"
product_name      = "fastag"
env               = "stage"


// VPC related variables
vpc_cidr_block = "10.20.0.0/16"


//tags
owner_key        = "Owner"
owner_value      = "prashantp@lambdatest.com"

// Public Subnet CIDR
public_subnet_cidr_block_a = "10.20.1.0/24"
public_subnet_cidr_block_b = "10.20.2.0/24"


// Private Subnet CIDR
private_subnet_cidr_block_a = "10.20.3.0/24"
private_subnet_cidr_block_b = "10.20.4.0/24"


// Database Subnet CIDR
database_subnet_cidr_block_a = "10.20.5.0/24"
database_subnet_cidr_block_b = "10.20.6.0/24"