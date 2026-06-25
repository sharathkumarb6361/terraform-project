output "instance_public_ip" {
  description = "Public IP Address of EC2 Instance"
  value       = aws_instance.nginx-server.public_ip
}
