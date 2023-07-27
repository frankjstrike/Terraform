resource "aws_instance" "instance" {
  count = 2

  ami = var.ami
  instance_type = var.instance_type
  security_groups = [ aws_security_group.allow_http.name, aws_security_group.allow_ssh.name, aws_security_group.allow_all_outbound.name ]
  key_name = var.key_name
  user_data = templatefile("${path.module}/user_data.sh", {})
  tags = {
    Name = "Webserver ${count.index}"
    Environment = var.environment
    OS = var.os
  }
}