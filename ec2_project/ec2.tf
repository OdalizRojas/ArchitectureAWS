data "aws_ami" "amazon-linux-2" {
 most_recent = true
 filter {
   name   = "owner-alias"
   values = ["amazon"]
 }
 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }
}

data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "demian-terraform-state"
    key = "network.ftstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  key_name      = "upb-first-instance"
  vpc_security_group_ids = [aws_security_group.upb_sg.id]
  subnet_id     = data.terraform_remote_state.network.outputs.web_A
    tags = {
    Name = "ec2-project"
  }
}

# module "sg" {
#   source = "../"
#   sg_name = ""
#   vpc_id = ""
#   ssh-connection = "yes"
#   ingress = [{
#     port = "",
#     protocol = "",
#     cidr_block = [""]
#   },
#   {
#     port = 3306,
#     protocol = "",
#     cidr_block = [""]
#   }]

#   egress = [{
#     port = 22,
#     protocol = "",
#     cidr_block = [""]
#   }]
# }

resource "aws_security_group" "upb_sg" {
  name        = "upb_sg"
  description = "ALLOW ssh traffic"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "upb_sg"
  }
}