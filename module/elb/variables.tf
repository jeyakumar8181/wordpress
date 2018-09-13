
variable "name" {
        description = "Type of instance"
        default = "ebizon"
}
variable "vpc_id" {
  default = "vpc-0ef67e6b"
}
variable "server_id" {}
variable "elb_subnet" {}
