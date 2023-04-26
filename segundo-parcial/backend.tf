terraform {
  backend "s3" {
    bucket = "demian-terraform-state"
    key    = "segundoparcial.ftstate"
    region = "us-east-1" 
    dynamodb_table = "odaliz-terraform-stateDB"
  }
}