output "vpc_id" {
    value = aws_vpc.main_vpc.id
}
output "vpc_arn" {
    value = aws_vpc.main_vpc.arn
}
output "web_A" {
  value = aws_subnet.subnets["sn-web-A"].id
}
output "web_B" {
  value = aws_subnet.subnets["sn-web-B"].id
}
output "web_C" {
  value = aws_subnet.subnets["sn-web-C"].id
}