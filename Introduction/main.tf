# Proveeder de AWS
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Terraform State in S3 Bucket
# 1. Crear el bucket en S3 -> Console
# 2. Crear Dynamo DB -> Console

terraform {
    backend "s3" {
    bucket = "demian-terraform-state"
    key    = "introduction/terraform.tfstate"
    region = "us-east-1"
    # Mandatory -> Partition Key = LockID  
    dynamodb_table = "odaliz-terraform-stateDB"
    }
}

# Creacion de IAM User
resource "aws_iam_user" "test_user" {
  name = "my_test_user2"
}

