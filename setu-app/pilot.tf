provider "aws" {
  region = var.region
}

####################################################################################
####                                                                            ####
####  Please Note:                                                              ####
####  Terraform backend doesn't allow interpolations that is why following      ####
####  variables are hard-coded. To setup the infra in a completely new/separate ####
####  account, the developer would have to make a S3 Bucket manually and pass   ####
####  the bucket name in the following configuration.                           ####
####                                                                            ####
####################################################################################


terraform {
  backend "s3" {
    bucket         = "setu-app-stage-tf-state"
    key            = "setu-app/setu-app-stage-core.tfstate"
    region         = "us-east-1"
    dynamodb_table = "stage-terraform-state-file-setu-app"

  }
}


####################################################################################
####                                                                            ####
####                      Networking state file sharing                         ####
####                                                                            ####
####################################################################################
data "terraform_remote_state" "networking_state" {
  backend = "s3"

  config = {
    bucket = "setu-app-stage-tf-state"
    key    = "setu-app/setu-app-stage.tfstate"
    region = "us-east-1"
  }
}