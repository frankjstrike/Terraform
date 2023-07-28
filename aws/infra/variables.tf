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

variable "default_tags" {
  type = map(string)
  default = {
    "Name"     = "my_terraform_instance"
    "Lifeycle" = "Test"
    "OS"       = "Ubuntu 22.04"
  }
}

variable "bucket_name" {
  type    = string
  default = "my-terraform-bucket"
}

variable "key_name" {
  type    = string
  default = "my_key_name"
}

variable "environment_name" {
  description = "value of environment"
  type        = string
}