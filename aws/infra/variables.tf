variable "region" {
  default = "us-east-1"
}
  
variable "ami" {
  type    = string
  default = "ami-011899242bb902164"
}

variable "os" {
  type    = string
  default = "Ubuntu 22.04"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "default_tags"{
    type = map(string)
    default = {
      "Name"      = "my_terraform_instance"
      "Lifeycle"  = "Test"
      "OS"        = "Ubuntu 22.04"
    }
}

variable "user_data" {
    type = string
    default = <<-EOF
  #!/bin/bash
  sudo apt update
  sudo apt upgrade -y
  sudo apt install apache2 -y
  sudo systemctl start apache2
  sudo systemctl enable apache2
  sudo echo "Hello World from $(hostname -f)" > /var/www/html/index.html
  EOF
}

variable "bucket_name" {
    type = string
    default = "my-terraform-bucket"
}

variable "key_name" {
    type = string
    default = "my_key_name"
}

