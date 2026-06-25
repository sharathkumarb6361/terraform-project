resource "aws_instance" "nginx-server" {
  ami                         = "ami-0521cb2d60cfbb1a6"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = [aws_security_group.nginx-sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
    yum install nginx -y
    systemctl enable nginx
    systemctl start nginx
  EOF

  tags = {
    Name = "nginx_server"
  }
}
