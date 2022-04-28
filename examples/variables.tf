variable "region" {
  description = "The region to provision resources in."
  type        = string
}

variable "ami" {
  description = "The AMI to use for the instance."
  type        = list(string)
}

variable "virtualization_type" {
  description = "The type of virtualization of the AMI."
  type        = list(string)
}

variable "ami_owner" {
  description = "Owner of the given AMI."
  type        = list(string)
}

variable "role_name" {
  description = "The role name for the IAM instance profile."
  type        = string
}

variable "iam_instance_profile_name" {
  description = "The name of the IAM Instance Profile to launch the instance with."
  type        = string
}

variable "instance_type" {
  description = "The instance type to use for the instance."
  type        = string
}

variable "key_name" {
  description = "The key name of the key pair to use for the instance."
  type        = string
}

variable "subnet_id" {
  description = "VPC Subnet ID the instance is launched in."
  type        = string
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with the instance."
  type        = list(string)
  sensitive   = true
}

variable "root_block_device" {
  description = "Configuration block to customize details about the root block device of the instance."
  type        = list(any)
}

variable "ebs_volume_size" {
  description = "Size of the additional EBS volumes in gigabytes."
  type        = number
}

variable "ebs_volume_type" {
  description = "The type of the additional EBS volumes. Can be standard, gp2, gp3, io1, i02, sc1, or st1."
  type        = string
}

variable "ebs_volume_encrypted" {
  description = "Whether to encrypt the additional EBS volumes."
  type        = bool
}

variable "ebs_device_name" {
  description = "The device name to expose to the instance."
  type        = string
}

variable "tags" {
  description = "A map of tags for the resources."
  type        = map(string)
}
