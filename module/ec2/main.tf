provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}
resource "aws_instance" "example" {
        ami = "${var.ami}"
        instance_type = "${var.instance_type}"
        key_name = "${var.key_name}"
                subnet_id = "${var.ec2_subnet}"
        security_groups = ["${aws_security_group.allow.id}"]
        associate_public_ip_address = "true"
        tags {
        Name = "Ebizon"
		}
        user_data = "${file("./module/ec2/wordpress.sh")}"

        }

resource "aws_security_group" "allow" {
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
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name         = "allow"
  }
}
