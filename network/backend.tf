terraform {
  backend "s3" {
    bucket = "demian-terraform-state"
    key    = "network.ftstate"
    region = "us-east-1"
    # Mandatory -> Partition Key = LockID  
    dynamodb_table = "odaliz-terraform-stateDB"
  }
}