resource "aws_instance" "instance_1" {
  ami = var.ami
  instance_type = var.instance_type
  security_groups = [ aws_security_group.allow_http.name, aws_security_group.allow_ssh.name, aws_security_group.allow_all_outbound.name ]
  key_name = var.key_name
  tags = var.default_tags
  user_data = var.user_data
  depends_on = [ aws_security_group.allow_http, aws_security_group.allow_ssh, aws_security_group.allow_all_outbound ]
}

resource "aws_instance" "instance_2" {
  ami = var.ami
  instance_type = var.instance_type
  security_groups = [ aws_security_group.allow_http.name, aws_security_group.allow_ssh.name, aws_security_group.allow_all_outbound.name ]
  key_name = var.key_name
  tags = var.default_tags
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt upgrade -y
              sudo apt install apache2 -y
              sudo systemctl start apache2
              sudo systemctl enable apache2
              sudo echo "Hello World from $(hostname -f)" > /var/www/html/index.html
              EOF
  depends_on = [ aws_security_group.allow_http, aws_security_group.allow_ssh, aws_security_group.allow_all_outbound ]
}

resource "aws_instance" "instance_3" {
  ami = var.ami
  instance_type = var.instance_type
  security_groups = [ aws_security_group.allow_http.name, aws_security_group.allow_ssh.name, aws_security_group.allow_all_outbound.name ]
  key_name = var.key_name
  tags = var.default_tags
  user_data = templatefile("${path.module}/user_data.sh", {})
  depends_on = [ aws_security_group.allow_http, aws_security_group.allow_ssh, aws_security_group.allow_all_outbound ]
}