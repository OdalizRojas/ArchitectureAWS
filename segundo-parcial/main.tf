# Create a VPC
module "upb_network" {
    source = "../modules/network-2parcial"
    app_prefix = "upb3"
    ip_range_prefix = "10.16"
}

