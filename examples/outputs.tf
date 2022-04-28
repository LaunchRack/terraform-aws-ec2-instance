output "id" {
  description = "The ID of the instance."
  value       = module.aws_ec2_instance.id
}

output "arn" {
  description = "ARN of the instance."
  value       = module.aws_ec2_instance.arn
}

output "public_ip" {
  description = "Public IP of instance."
  value       = module.aws_ec2_instance.public_ip
}

output "private_ip" {
  description = "Private IP of instance."
  value       = module.aws_ec2_instance.private_ip
}

output "public_dns" {
  description = "Public DNS of instance."
  value       = module.aws_ec2_instance.public_dns
}

output "private_dns" {
  description = "Private DNS of instance."
  value       = module.aws_ec2_instance.private_dns
}

output "ebs_ids" {
  description = "The EBS volumes Id."
  value       = module.aws_ec2_instance.ebs_ids
}
