# setu-app-infra
![Setu architecture drawio](https://user-images.githubusercontent.com/82140743/218332701-43af7a5e-7415-47d7-86f5-cb84f90a21db.png)

## Network resource mapping
![Screenshot 2023-02-11 at 5 49 43 PM](https://user-images.githubusercontent.com/82140743/218334978-b89b91c0-c778-4bdf-b802-75485152287f.png)



# Terraform Project Structure
This repository contains two Terraform templates to deploy a complete infrastructure on AWS for the above architecture. The templates are designed to be run in a specific order, with base-networking being run first and setu-app being run second.

## base-networking
The '**base-networking**' template creates the following AWS resources:

* Virtual Private Cloud (VPC)
* Network Address Translation (NAT) gateway
* Internet Gateway (IGW)
* Subnets
* Route tables

## setu-app
The '**setu-app**' template creates the following AWS resources:

The setu-app template builds upon the resources created in base-networking to create the following additional AWS resources:

* Amazon Elastic Container Service (ECS) cluster
* ECS service
* Amazon Relational Database Service (RDS)
* Application Load Balancer (ALB)
* IAM roles
* Security groups

After running the setu-app template, you will receive two DNS names for the Application Load Balancer (ALB): a public DNS name and a private DNS name. The public DNS name can be accessed from anywhere which will be pointing to public ECS service, while the private DNS name can only be accessed through the public ECS service and Bastion host.

## GitHub Actions Deployment
A ```deploy.yml``` GitHub Actions workflow is also provided in the ```.github/workflows``` directory. This workflow can be used to deploy your Terraform resources directly from GitHub using an AWS OIDC role.
![Screenshot 2023-02-12 at 11 54 27 PM](https://user-images.githubusercontent.com/82140743/218334988-10a2adcf-39fa-4449-bcca-3eddc1bad0b3.png)

### Prerequisites
Before running the Terraform templates, you must have the following:

1. Terraform installed on your machine
2. AWS account with administrative access
3. AWS CLI configured on your machine
4. TF backend of your choice in pilot.tf
5. Key pair created to be used with EC2 bastion server.

## Getting Started - 
Clone the repository to your local machine.
```
git clone https://github.com/pratikbhawsar26/setu-infra.git
```
Change into the base-networking directory.
```
cd base-networking
```
Initialize Terraform.
```
terraform init
```
Run Terraform plan to see what changes will be made to your infrastructure.
```
terraform plan
```
Apply the Terraform changes.
```
terraform apply
```
Repeat steps 2 through 5 for the setu-app template.

Once the templates have been successfully applied, you should see the newly created AWS resources in the AWS Management Console.

Note
It is important to thoroughly review the Terraform templates before applying changes to your infrastructure, as the templates will create resources that will incur charges on your AWS account.
