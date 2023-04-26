
locals {
    vpc_cidr = "${var.ip_range_prefix}.0.0/16"
    subnets = {
        "sn-web-A" = {
            cidr_block_suffix = "48.0/20"
            az = "us-east-1a"
        }
        "sn-web-B" = {
            cidr_block_suffix = "112.0/20"
            az = "us-east-1b"
        }
    }
}