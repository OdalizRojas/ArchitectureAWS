data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "demian-terraform-state"
    key = "network.ftstate"
    region = "us-east-1"
  }
}

data "aws_vpc" "our_vpc" {
  filter {
    name = "tag:Name"
    values = ["upb-vpc"]
  }
}