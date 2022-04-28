<p align="center">
  <a href="https://launchrack.com/" target="_blank" rel="homepage">
  <img src="https://launchrack.com/assets/img/logo_launchrack.png" alt="LaunchRack logo" style="width: 600px;" class="d-md-inline-block">
  </a>
</p>

<p>
We are huge followers of the <b>Cloud-Native DevOps</b> movement and are firm believers in the power of treating <b>Infrastructure as Code</b> using immutable architecture & <b>GitOps</b> style deployments. We adhere to a strict automation mindset (automation first, as opposed to manual first with automation later) and strive to provide the best technical acumen that will enable organizations improve <b>Cloud Security</b> Posture, <b>Release</b> More Often, <b>Scale</b> with Demand, Brace <b>Agility</b>, Operate within <b>Budget</b> and focus on value derived by the time saved on the execution of a task rather than having to spend cycles on design & tool selection.
</p>

<p>
  <h4 style="text-align: left"> 
    Our consistent and automated processes can help you improve:
  </h4>
</p>

<p style="text-align: left;">
✔ Better <b>utilization</b> of cloud resources by 40% <br>
✔ Self-service infrastructure <b>provisioning</b> by 35% <br>
✔ <b>Security</b> and governance by 30% <br>
✔ Return on value/investment by 20% <br>
✔ Team management & <b>governance</b> by 15% <br>
✔ Earlier <b>detection</b> of bugs by 32% <br>
✔ Response to issues/events by 23% <br>
</p>

<p>
  <h4 align="center">
    Chat more?
    <a href="mailto:info@launchrack.com">Email</a>
    <span style="color:white"> | </span> 
    <a href="https://launchrack.com/contact/" target="_blank">Contact us</a>
  </h4>
</p>
<p align="center">
     <a href="https://www.linkedin.com/company/launchrack"> 
     <img alt="linkedin logo" src="https://user-images.githubusercontent.com/100512415/158441415-f399bf91-f65a-4568-8882-2785715c86b0.png" style="height: 20px;width: 20px;"/>
     </a>
     <a href="https://www.twitter.com/launchrack">
     <img alt="twitter logo" src="https://user-images.githubusercontent.com/100512415/158441443-3851792d-2a40-47f6-a45a-7f576134797b.png" style="height: 20px;width: 20px;"/>
     </a>
     <a href="https://www.facebook.com/launchrack">
     <img alt="facebook logo" src="https://user-images.githubusercontent.com/100512415/158447347-2068d8c1-80fa-4f15-a9a0-7aeff94a7fd9.png" style="height: 20px;width: 20px;"/>
     </a>
</p>

---

# Terraform AWS EC2 instance 

[![GitHub license](https://img.shields.io/github/license/launchrack/terraform-aws-ec2-instance?color=blue)](https://github.com/LaunchRack/terraform-aws-ec2-instance/blob/main/LICENSE)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/launchrack/terraform-aws-ec2-instance?color=blue&display_name=release)

Creates an EC2 instance on AWS

## Features
Creates an EC2 instance with static EIP and an EBS volume

## Usage
```hcl
module "aws_key_pair" {
  source        = "git::https://github.com/LaunchRack/terraform-aws-ec2-instance.git"

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
  ebs_volume_size       = 20
  ebs_volume_type       = "gp2"
  ebs_volume_encrypted  = false 
  ebs_device_name       = "/dev/xvdb"

  tags = {
    BusinessUnit = "tools"
    Application  = "cicd"
  }
}
```

## Setup Instructions
`terraform init`

`terraform plan` # use `-var-file=terraform.tfvars` if you plan to use a different file for the value overrides. See [examples](https://github.com/LaunchRack/terraform-aws-ec2-instance/blob/main/examples/terraform.tfvars) folder

`terraform apply -auto-approve` # use `-var-file=terraform.tfvars` if you plan to use a different file for the value overrides. See [examples](https://github.com/LaunchRack/terraform-aws-ec2-instance/blob/main/examples/terraform.tfvars) folder


> **Note:** The `terraform.tfvars` file will need to be created in the root directory with value overrides

## Requirements
| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement_aws) | ~> 4.0 |
| <a name="requirement_local"></a> [local](#requirement_local) | ~> 2.0 |
| <a name="requirement_null"></a> [null](#requirement_null) | ~> 3.0 |

## Providers
| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider_aws) | ~> 4.0 |

## Resources
| Name | Type |
|------|------|
| [aws_ebs_volume.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_volume) | resource |
| [aws_eip.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_iam_instance_profile.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_instance.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_volume_attachment.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/volume_attachment) | resource |
| [aws_ami.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_iam_policy_document.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_subnet.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input_ami) | The AMI to use for the instance. | `list(string)` | `[]` | yes |
| <a name="input_ami_owner"></a> [ami_owner](#input_ami_owner) | Owner of the given AMI. | `list(string)` | `[]` | yes |
| <a name="input_associate_public_ip_address"></a> [associate_public_ip_address](#input_associate_public_ip_address) | Whether to associate a public IP address with the instance. | `bool` | `true` | no |
| <a name="input_cpu_credits"></a> [cpu_credits](#input_cpu_credits) | The credit option for CPU usage. Can be `standard` or `unlimited`. T3 instances are launched as unlimited by default. T2 instances are launched as standard by default. | `string` | `"standard"` | no |
| <a name="input_disable_api_termination"></a> [disable_api_termination](#input_disable_api_termination) | Whether to enable EC2 instance termination protection. | `bool` | `false` | no |
| <a name="input_ebs_device_name"></a> [ebs_device_name](#input_ebs_device_name) | The device name to expose to the instance. | `string` | `""` | no |
| <a name="input_ebs_iops"></a> [ebs_iops](#input_ebs_iops) | Amount of provisioned IOPS. This must be set with a volume_type of io1, io2 or gp3. | `number` | `0` | no |
| <a name="input_ebs_optimized"></a> [ebs_optimized](#input_ebs_optimized) | Whether the launched EC2 instance will need to be EBS-optimized. | `bool` | `true` | no |
| <a name="input_ebs_volume_encrypted"></a> [ebs_volume_encrypted](#input_ebs_volume_encrypted) | Whether to encrypt the additional EBS volumes. | `bool` | `true` | no |
| <a name="input_ebs_volume_size"></a> [ebs_volume_size](#input_ebs_volume_size) | Size of the additional EBS volumes in gigabytes. | `number` | `10` | no |
| <a name="input_ebs_volume_type"></a> [ebs_volume_type](#input_ebs_volume_type) | The type of the additional EBS volumes. Can be standard, gp2, gp3, io1, i02, sc1, or st1. | `string` | `"gp2"` | no |
| <a name="input_ephemeral_block_device"></a> [ephemeral_block_device](#input_ephemeral_block_device) | Configuration block to customize details about instance Store volumes on the instance. | `list(any)` | `[]` | no |
| <a name="input_iam_instance_profile_name"></a> [iam_instance_profile_name](#input_iam_instance_profile_name) | The name of the IAM Instance Profile to launch the instance with. | `string` | `""` | yes |
| <a name="input_instance_initiated_shutdown_behavior"></a> [instance_initiated_shutdown_behavior](#input_instance_initiated_shutdown_behavior) | Shutdown behavior for the instance. | `string` | `"terminate"` | no |
| <a name="input_instance_type"></a> [instance_type](#input_instance_type) | The instance type to use for the instance. | `string` | `""` | yes |
| <a name="input_ipv6_address_count"></a> [ipv6_address_count](#input_ipv6_address_count) | A number of IPv6 addresses to associate with the primary network interface. | `number` | `0` | no |
| <a name="input_ipv6_addresses"></a> [ipv6_addresses](#input_ipv6_addresses) | List of IPv6 addresses from the range of the subnet to associate with the primary network interface. | `list(any)` | `[]` | no |
| <a name="input_key_name"></a> [key_name](#input_key_name) | The key name of the key pair to use for the instance. | `string` | `""` | no |
| <a name="input_kms_key_id"></a> [kms_key_id](#input_kms_key_id) | The ARN for the KMS encryption key. When specifying kms_key_id, encrypted needs to be set to true. | `string` | `""` | no |
| <a name="input_metadata_http_endpoint_enabled"></a> [metadata_http_endpoint_enabled](#input_metadata_http_endpoint_enabled) | Whether the metadata service is available. Valid values include enabled or disabled. Defaults to enabled. | `string` | `"enabled"` | no |
| <a name="input_metadata_http_put_response_hop_limit"></a> [metadata_http_put_response_hop_limit](#input_metadata_http_put_response_hop_limit) | The desired HTTP PUT response hop limit (between 1 and 64) for instance metadata requests. | `number` | `2` | no |
| <a name="input_metadata_http_tokens_required"></a> [metadata_http_tokens_required](#input_metadata_http_tokens_required) | Whether or not the metadata service requires session tokens, also referred to as Instance Metadata Service Version 2 (IMDSv2). Valid values include optional or required. Defaults to optional. | `string` | `"optional"` | no |
| <a name="input_monitoring"></a> [monitoring](#input_monitoring) | Whether to enable detailed monitoring for the launched EC2 instance. | `bool` | `true` | no |
| <a name="input_network_interface"></a> [network_interface](#input_network_interface) | Configuration block to customize network interfaces to be attached at instance boot time. | `list(map(string))` | `[]` | no |
| <a name="input_placement_group"></a> [placement_group](#input_placement_group) | The Placement Group to start the instance in. | `string` | `""` | no |
| <a name="input_role_name"></a> [role_name](#input_role_name) | The role name for the IAM instance profile. | `string` | `""` | yes |
| <a name="input_root_block_device"></a> [root_block_device](#input_root_block_device) | Configuration block to customize details about the root block device of the instance. | `list(any)` | `[]` | no |
| <a name="input_source_dest_check"></a> [source_dest_check](#input_source_dest_check) | Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs. | `bool` | `true` | no |
| <a name="input_subnet_id"></a> [subnet_id](#input_subnet_id) | VPC Subnet ID the instance is launched in. | `string` | `null` | yes |
| <a name="input_tags"></a> [tags](#input_tags) | A map of tags for the resources. | `map(string)` | `{}` | no |
| <a name="input_tenancy"></a> [tenancy](#input_tenancy) | The tenancy of the instance. An instance with a tenancy of dedicated runs on single-tenant hardware. The host tenancy is not supported for the import-instance command. | `string` | `"default"` | no |
| <a name="input_virtualization_type"></a> [virtualization_type](#input_virtualization_type) | The type of virtualization of the AMI. | `list(string)` | `["hvm"]` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc_security_group_ids](#input_vpc_security_group_ids) | A list of security group IDs to associate with the instance. | `list(string)` | `[]` | no |

## Outputs
| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output_arn) | ARN of the instance. |
| <a name="output_ebs_ids"></a> [ebs_ids](#output_ebs_ids) | The EBS volumes Id. |
| <a name="output_id"></a> [id](#output_id) | The ID of the instance. |
| <a name="output_private_dns"></a> [private_dns](#output_private_dns) | Private DNS of instance. |
| <a name="output_private_ip"></a> [private_ip](#output_private_ip) | Private IP of instance. |
| <a name="output_public_dns"></a> [public_dns](#output_public_dns) | Public DNS of instance. |
| <a name="output_public_ip"></a> [public_ip](#output_public_ip) | Public IP of instance. |

## Authors
This module is maintained by our awsome platform engineering team. Here are our [contributors](https://github.com/LaunchRack/terraform-aws-ec2-instance/graphs/contributors)

## License
See [LICENSE](https://github.com/LaunchRack/terraform-aws-ec2-instance/blob/master/LICENSE) for full details

## Trademarks
All other trademarks referenced herein are the property of their respective owners
