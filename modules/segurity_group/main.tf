data "aws_vpc" "default_vpc" {
  default = true
}

resource "aws_security_group" "sg" {
  name        = var.sg_name
  vpc_id      = var.vpc_id == "default_vpc" ? data.aws_vpc.default_vpc.id : var.vpc_id

  dynamic ingress {
    for_each = var.ingress_rules
    content {
      description      = ingress.value.description
      from_port        = ingress.value.port
      to_port          = ingress.value.port
      protocol         = ingress.value.protocol
      cidr_blocks      = ingress.value.cidr_blocks
      security_groups = ingress.value.vpc_security_groups
    }
  }

  dynamic egress {
    for_each = var.egress_rules
    content {
      description      = egress.value.description
      from_port        = egress.value.port
      to_port          = egress.value.port
      protocol         = egress.value.protocol
      cidr_blocks      = egress.value.cidr_blocks
      security_groups = egress.value.vpc_security_groups
    }
  }

  tags = {
    Name = var.sg_name
  }
}