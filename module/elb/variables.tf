
variable "name" {
        description = "Type of instance"
        default = "ebizon"
}
variable "vpc_id" {
  default = "vpc-881a21f3"
}
variable "server_id" {}
variable "elb_subnet" {}
