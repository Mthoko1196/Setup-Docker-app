# output "instance_id" {
#   description = "ID of the EC2 instance"
#   value       = aws_instance.web.id
# }

# output "instance_public_ip" {
#   description = "Public IP of the EC2 instance"
#   value       = aws_instance.web.public_ip
# }

output "security_group_id" {
  description = "Security group ID for the EC2 instance"
  value       = aws_security_group.web_sg.id
}

output "instance_id" {
  value = aws_instance.web.id
}

output "public_ip" {
  value = aws_instance.web.public_ip
}
