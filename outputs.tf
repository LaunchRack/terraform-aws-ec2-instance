output "id" {
  description = "The ID of the instance."
  value       = aws_instance.default.id
}

output "arn" {
  description = "ARN of the instance."
  value       = aws_instance.default.arn
}

output "public_ip" {
  description = "Public IP of instance."
  value       = concat(aws_eip.default.*.public_ip, aws_instance.default.*.public_ip, [""])[0]
}

output "private_ip" {
  description = "Private IP of instance."
  value       = aws_instance.default.private_ip
}

output "public_dns" {
  description = "Public DNS of instance."
  value       = aws_instance.default.public_dns
}

output "private_dns" {
  description = "Private DNS of instance."
  value       = aws_instance.default.private_dns
}

output "ebs_ids" {
  description = "The EBS volumes Id."
  value       = aws_ebs_volume.default.id
}
