module "upb_network" {
    source = "../modules/network"
    app_prefix = "upb"
    ip_range_prefix = "10.16"
}