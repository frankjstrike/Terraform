output "alb_security_group_id" {
  value = aws_security_group.alb.id
}

output "instace_1_hostname" {
  value = aws_instance.instance_1.public_dns
}

output "instace_2_hostname" {
  value = aws_instance.instance_2.public_dns
}

output "instace_3_hostname" {
  value = aws_instance.instance_3.public_dns
}

output "alb_hostname" {
  value = aws_lb.load_balancer.dns_name
}