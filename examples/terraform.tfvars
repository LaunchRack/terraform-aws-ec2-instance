region                    = "us-east-1"
ami                       = ["ami-xxxxxxxxxxxxxxxxx"]
virtualization_type       = ["hvm"]
ami_owner                 = ["amazon"]
role_name                 = "my-instance-role"
iam_instance_profile_name = "my-instance-profile"
instance_type             = "t2.micro"
key_name                  = "my-keypair"
subnet_id                 = "subnet-xxxxxxxxxxxxxxxx"
vpc_security_group_ids    = ["sg-xxxxxxxxxxxxxxxxx"]
root_block_device = [
  {
    delete_on_termination = false
    encrypted             = false
    volume_size           = 20
    volume_type           = "gp2"
  }
]
ebs_volume_size      = 20
ebs_volume_type      = "gp2"
ebs_volume_encrypted = false
ebs_device_name      = "/dev/xvdb"
tags = {
  BusinessUnit = "tools"
  Application  = "cicd"
}
