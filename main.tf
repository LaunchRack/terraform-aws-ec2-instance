data "aws_ami" "default" {
  most_recent = true

  filter {
    name   = "name"
    values = var.ami
  }

  filter {
    name   = "virtualization-type"
    values = var.virtualization_type
  }

  owners = var.ami_owner
}

data "aws_iam_policy_document" "default" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "default" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.default.json
  tags               = var.tags
}

resource "aws_iam_instance_profile" "default" {
  name = var.iam_instance_profile_name
  role = aws_iam_role.default.name
}

resource "aws_instance" "default" {
  ami                                  = data.aws_ami.default.id
  associate_public_ip_address          = var.associate_public_ip_address
  disable_api_termination              = var.disable_api_termination
  ebs_optimized                        = var.ebs_optimized
  iam_instance_profile                 = aws_iam_instance_profile.default.name
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  instance_type                        = var.instance_type
  ipv6_address_count                   = var.ipv6_address_count
  ipv6_addresses                       = var.ipv6_addresses
  key_name                             = var.key_name
  monitoring                           = var.monitoring
  source_dest_check                    = var.source_dest_check
  subnet_id                            = var.subnet_id
  tenancy                              = var.tenancy
  vpc_security_group_ids               = var.vpc_security_group_ids
  placement_group                      = var.placement_group

  dynamic "root_block_device" {
    for_each = var.root_block_device
    content {
      delete_on_termination = lookup(root_block_device.value, "delete_on_termination", null)
      encrypted             = lookup(root_block_device.value, "encrypted", null)
      iops                  = lookup(root_block_device.value, "iops", null)
      kms_key_id            = lookup(root_block_device.value, "kms_key_id", null)
      volume_size           = lookup(root_block_device.value, "volume_size", null)
      volume_type           = lookup(root_block_device.value, "volume_type", null)
      tags                  = var.tags
    }
  }

  dynamic "ephemeral_block_device" {
    for_each = var.ephemeral_block_device
    content {
      device_name  = ephemeral_block_device.value.device_name
      no_device    = lookup(ephemeral_block_device.value, "no_device", null)
      virtual_name = lookup(ephemeral_block_device.value, "virtual_name", null)
    }
  }

  metadata_options {
    http_endpoint               = var.metadata_http_endpoint_enabled
    http_put_response_hop_limit = var.metadata_http_put_response_hop_limit
    http_tokens                 = var.metadata_http_tokens_required
  }

  credit_specification {
    cpu_credits = var.cpu_credits
  }

  dynamic "network_interface" {
    for_each = var.network_interface
    content {
      device_index          = network_interface.value.device_index
      network_interface_id  = lookup(network_interface.value, "network_interface_id", null)
      delete_on_termination = lookup(network_interface.value, "delete_on_termination", false)
    }
  }

  lifecycle {
    ignore_changes = [
      private_ip,
    ]
  }

  tags = var.tags
}

resource "aws_eip" "default" {
  instance = aws_instance.default.id
  vpc      = true
  tags     = var.tags
}

data "aws_subnet" "selected" {
  id = var.subnet_id
}

resource "aws_ebs_volume" "default" {
  availability_zone = data.aws_subnet.selected.availability_zone
  size              = var.ebs_volume_size
  iops              = var.ebs_iops
  type              = var.ebs_volume_type
  tags              = var.tags
  encrypted         = var.ebs_volume_encrypted
  kms_key_id        = var.kms_key_id
}

resource "aws_volume_attachment" "default" {
  device_name = var.ebs_device_name
  volume_id   = aws_ebs_volume.default.id
  instance_id = aws_instance.default.id
}
