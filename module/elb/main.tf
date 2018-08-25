resource "aws_elb" "example" {
  name               = "${var.name}"
  subnets = ["subnet-6931a423"]
  security_groups = ["${aws_security_group.elb.id}"]



  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  instances = ["${module.ec2_instance.server_id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  
  tags {
    Name = "example-terraform-elb"
  }
}
resource "aws_security_group" "elb" {
  vpc_id      = "${var.vpc_id}"
  name        = "allow-Access"
  description = "security group that allows ssh,http and all egress traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name         = "allow"
  }
  }
  module "ec2_instance" {
        source = "../../module/ec2"
}
