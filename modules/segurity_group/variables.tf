variable "sg_name" {
    type = string
}

variable "vpc_id" {
    type = string
    default = "default_vpc"
}

variable "ingress_rules" {
}
variable "egress_rules" {
}