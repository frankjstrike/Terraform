output "alb_security_group_id" {
  value = aws_security_group.alb.id
}

output "instance_hostnames" {
  value = [for i in aws_instance.instance : i.public_dns]
  description = "The public DNS of the instances"
}

output "alb_hostname" {
  value = aws_lb.load_balancer.dns_name
}