##########################################################
///ALBの定義
##########################################################
resource "aws_lb" "for_webserver" {
  name               = "webserver-alb"
  internal           = false             #falseを指定するとインターネット向け,trueを指定すると内部向け
  load_balancer_type = "application"

  security_groups    = [
    aws_security_group.alb.id
  ]

  subnets            = [
      aws_subnet.pub_subnet1.id,
      aws_subnet.pub_subnet2.id,
  ]
}

##########################################################
///ALBに付与するセキュリティグループの定義
##########################################################

resource "aws_security_group" "alb" {
    name ="alb"
    vpc_id= aws_vpc.vpc.id
    ingress{
        from_port = 80
        to_port   = 80
        protocol  = "tcp"
        cidr_blocks =["0.0.0.0/0"]
    }
   egress{
       from_port  = 0
       to_port    = 0
       protocol   = "-1"
       cidr_blocks=["0.0.0.0/0"]
   }
}

##########################################################
///ALBのリスナーの定義
##########################################################

resource "aws_lb_listener" "for_webserver" {
  load_balancer_arn = aws_lb.for_webserver.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.for_webserver.arn
  }

}

///リスナールールの定義

resource "aws_lb_listener_rule" "forward" {
  listener_arn = aws_lb_listener.for_webserver.arn
  priority     = 99

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.for_webserver.arn
  }

  condition {
      path_pattern{
        values = ["/*"]
      }
  }
}

resource "aws_lb_target_group" "for_webserver" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
}
