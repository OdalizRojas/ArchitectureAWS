variable "assume_role_service" {
    type = string
    default = "ec2.amazonaws.com"
}

variable "role_name" {
    type = string
}

variable "policy_statement" {
    description = "AWS Policy statement"
}