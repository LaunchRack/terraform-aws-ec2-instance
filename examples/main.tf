terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = "~> 1.0"
}

provider "aws" {
  region = var.region
}

module "aws_ec2_instance" {
  source                    = "../"
  ami                       = var.ami
  virtualization_type       = var.virtualization_type
  ami_owner                 = var.ami_owner
  role_name                 = var.role_name
  iam_instance_profile_name = var.iam_instance_profile_name
  instance_type             = var.instance_type
  key_name                  = var.key_name
  subnet_id                 = var.subnet_id
  vpc_security_group_ids    = var.vpc_security_group_ids
  root_block_device         = var.root_block_device
  ebs_volume_size           = var.ebs_volume_size
  ebs_volume_type           = var.ebs_volume_type
  ebs_volume_encrypted      = var.ebs_volume_encrypted
  ebs_device_name           = var.ebs_device_name
  tags                      = var.tags
}
