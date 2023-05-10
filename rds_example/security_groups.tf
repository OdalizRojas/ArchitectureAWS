module "database_sg" {
#   source = "git::https://github.com/mauri1789/aws-training.git//infrastructure/modules/security_group?ref=v1.6"
  source = "../modules/segurity_group"
  sg_name = "my_sg"

  ingress_rules = {
    mysql = {
      description = "my ssh rule"
      port    = "3306"
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      security_groups = [module.instance_sg.id]
    }
  }
  egress_rules = {
    all = {
      description = "all connections out allowed"
      port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

module "instance_sg" {
#   source = "git::https://github.com/mauri1789/aws-training.git//infrastructure/modules/security_group?ref=v1.6"
  source = "../modules/segurity_group"
  sg_name = "instance_sg"

  ingress_rules = {
    ssh = {
      description = "my ssh rule"
      port    = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      
    }
  }
  egress_rules = {
    all = {
      description = "all connections out allowed"
      port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}