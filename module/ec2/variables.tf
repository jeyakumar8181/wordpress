variable "access_key" {}
variable "secret_key" {}
variable "region" {}


variable "ami" {}
variable "instance_type" {}
variable  "key_name" {} 
variable "ec2_subnet" {}
variable "vpc_id" {
  default = "vpc-0ef67e6b"
}
