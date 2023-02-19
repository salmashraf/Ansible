resource "aws_lb" "public-lb" {
  name               = "Ansible-lb"
  internal           = false
  ip_address_type = "ipv4"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.pub-secgroup.id]
  subnets            = [aws_subnet.pub-subnet-1.id, aws_subnet.pub-subnet-2.id]
  tags = {
    Name = "public-lb"
  }
}

resource "aws_lb_target_group" "targetGroup1" {
  name     = "targetGroup1"
  port     = 8081
  protocol = "HTTP"
  vpc_id   = aws_vpc.myvpc.id
  tags = {
    Name = "Nexus-Target-Group"
  }
}
resource "aws_lb_target_group_attachment" "attach-priv1" {
  target_group_arn = aws_lb_target_group.targetGroup1.arn
  target_id        = aws_instance.private-ec2-1.id
  port             = 8081
}
resource "aws_lb_listener" "listener1" {
  load_balancer_arn = aws_lb.public-lb.arn
  protocol          = "HTTP"
  port              = 8081
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.targetGroup1.arn
  }
}

resource "aws_lb_target_group" "targetGroup2" {
  name     = "targetGroup2"
  port     = 9000
  protocol = "HTTP"
  vpc_id   = aws_vpc.myvpc.id
  tags = {
    Name = "Sonarcube-Target-Group"
  }
}
resource "aws_lb_target_group_attachment" "attach-priv2" {
  target_group_arn = aws_lb_target_group.targetGroup2.arn
  target_id        = aws_instance.private-ec2-2.id
  port             = 9000
}
resource "aws_lb_listener" "listener2" {
  load_balancer_arn = aws_lb.public-lb.arn
  protocol          = "HTTP"
  port              = 9000
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.targetGroup2.arn
  }
}