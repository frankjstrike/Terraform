resource "aws_lb" "load_balancer" {
  name = "test-lb"
  internal = false
  load_balancer_type = "application"
  subnets = data.aws_subnet_ids.default_subnet.ids
  security_groups = [ aws_security_group.alb.id ]
}

resource "aws_lb_target_group" "test-tg" {
  name = "test-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = data.aws_vpc.default.id

  health_check {
    path = "/"
    protocol = "HTTP"
    matcher = "200-399"
    interval = 30
    timeout = 5
    healthy_threshold = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port = "80"
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.test-tg.arn
  }
}

resource "aws_lb_target_group_attachment" "instance_1" {
  target_group_arn = aws_lb_target_group.test-tg.arn
  target_id = aws_instance.instance_1.id
  port = 80
}

resource "aws_lb_target_group_attachment" "instance_2" {
  target_group_arn = aws_lb_target_group.test-tg.arn
  target_id = aws_instance.instance_2.id
  port = 80
}

resource "aws_lb_target_group_attachment" "instance_3" {
  target_group_arn = aws_lb_target_group.test-tg.arn
  target_id = aws_instance.instance_3.id
  port = 80
}

resource "aws_lb_listener_rule" "test-listener" {
  listener_arn = aws_lb_listener.http.arn
  priority = 100

  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.test-tg.arn
  }

  condition {
    path_pattern {
      values = ["*"]
    }
  }
}