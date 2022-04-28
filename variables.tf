variable "ami" {
  description = "The AMI to use for the instance."
  type        = list(string)
  default     = []
}

variable "virtualization_type" {
  description = "The type of virtualization of the AMI."
  type        = list(string)
  default     = ["hvm"]
}

variable "ami_owner" {
  description = "Owner of the given AMI."
  type        = list(string)
  default     = []
}

variable "role_name" {
  description = "The role name for the IAM instance profile."
  type        = string
  default     = ""
}

variable "iam_instance_profile_name" {
  description = "The name of the IAM Instance Profile to launch the instance with."
  type        = string
  default     = ""
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with the instance."
  type        = bool
  default     = true
  sensitive   = true
}

variable "disable_api_termination" {
  description = "Whether to enable EC2 instance termination protection."
  type        = bool
  default     = false
}

variable "ebs_optimized" {
  description = "Whether the launched EC2 instance will need to be EBS-optimized."
  type        = bool
  default     = true
}

variable "instance_initiated_shutdown_behavior" {
  description = "Shutdown behavior for the instance."
  type        = string
  default     = "terminate"
}

variable "instance_type" {
  description = "The instance type to use for the instance."
  type        = string
  default     = ""
}

variable "ipv6_address_count" {
  description = "A number of IPv6 addresses to associate with the primary network interface."
  type        = number
  default     = 0
}

variable "ipv6_addresses" {
  description = "List of IPv6 addresses from the range of the subnet to associate with the primary network interface."
  type        = list(any)
  default     = []
  sensitive   = true
}

variable "key_name" {
  description = "The key name of the key pair to use for the instance."
  type        = string
  default     = ""
}

variable "monitoring" {
  description = "Whether to enable detailed monitoring for the launched EC2 instance."
  type        = bool
  default     = true
}

variable "source_dest_check" {
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs."
  type        = bool
  default     = true
}

variable "subnet_id" {
  description = "VPC Subnet ID the instance is launched in."
  type        = string
  default     = null
}

variable "tenancy" {
  description = "The tenancy of the instance. An instance with a tenancy of dedicated runs on single-tenant hardware. The host tenancy is not supported for the import-instance command."
  type        = string
  default     = "default"
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with the instance."
  type        = list(string)
  default     = []
  sensitive   = true
}

variable "placement_group" {
  description = "The Placement Group to start the instance in."
  type        = string
  default     = ""
}

variable "root_block_device" {
  description = "Configuration block to customize details about the root block device of the instance."
  type        = list(any)
  default     = []
}

variable "ephemeral_block_device" {
  description = "Configuration block to customize details about instance Store volumes on the instance."
  type        = list(any)
  default     = []
}

variable "metadata_http_tokens_required" {
  description = "Whether or not the metadata service requires session tokens, also referred to as Instance Metadata Service Version 2 (IMDSv2). Valid values include optional or required. Defaults to optional."
  type        = string
  default     = "optional"
}

variable "metadata_http_endpoint_enabled" {
  description = "Whether the metadata service is available. Valid values include enabled or disabled. Defaults to enabled."
  type        = string
  default     = "enabled"
}

variable "metadata_http_put_response_hop_limit" {
  description = "The desired HTTP PUT response hop limit (between 1 and 64) for instance metadata requests."
  type        = number
  default     = 2
}

variable "cpu_credits" {
  description = "The credit option for CPU usage. Can be `standard` or `unlimited`. T3 instances are launched as unlimited by default. T2 instances are launched as standard by default."
  type        = string
  default     = "standard"
}

variable "network_interface" {
  description = "Configuration block to customize network interfaces to be attached at instance boot time."
  type        = list(map(string))
  default     = []
}

variable "ebs_volume_size" {
  description = "Size of the additional EBS volumes in gigabytes."
  type        = number
  default     = 10
}

variable "ebs_iops" {
  description = "Amount of provisioned IOPS. This must be set with a volume_type of io1, io2 or gp3."
  type        = number
  default     = 0
}

variable "ebs_volume_type" {
  description = "The type of the additional EBS volumes. Can be standard, gp2, gp3, io1, i02, sc1, or st1."
  type        = string
  default     = "gp2"
}

variable "ebs_volume_encrypted" {
  description = "Whether to encrypt the additional EBS volumes."
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "The ARN for the KMS encryption key. When specifying kms_key_id, encrypted needs to be set to true."
  type        = string
  default     = ""
  sensitive   = true
}

variable "ebs_device_name" {
  description = "The device name to expose to the instance."
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags for the resources."
  type        = map(string)
  default     = {}
}
