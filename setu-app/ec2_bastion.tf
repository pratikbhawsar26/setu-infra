# Get latest Windows Server 2022 AMI
data "aws_ami" "windows_2022" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base*"]
  }
}

module "bastion_server" {
  source                      = "git::https://github.com/pratikbhawsar26/setu-infra-modules//ec2?ref=v1.0.15"
  name                        = "Bastion-server-setu"
  product_name                = var.product_name
  env                         = var.env
  subnet_id                   = data.terraform_remote_state.networking_state.outputs.public_subnet_1
  vpc_security_group_ids      = [module.security_group_ec2_bastion.security_group_id]
  availability_zone           = "${var.region}a"
  ami                         = data.aws_ami.windows_2022.id
  associate_public_ip_address = "true"
  instance_type               = var.bastion_instance_type
  iam_instance_profile        = ""
  key_name                    = var.key_name
  delete_on_termination       = "true"
  iops                        = 3000
  volume_size                 = 30
  volume_type                 = "gp3"
  tags = merge(
    local.global_tags,
    {
      "Creator" : "pratikbhawsar26@gmail.com",
      "Owner" : "pratikbhawsar26@gmail.com"
    }
  )
}