#############################################
####    Outputs from Network resource    ####
#############################################

output "vpc_id" {
  value = aws_vpc.my-vpc.id
}
output "subnet_1" {
  value = "${element(aws_subnet.web-subnet-1.*.id, 1)}"
}
output "subnet_2" {
  value = "${element(aws_subnet.web-subnet-2.*.id, 2)}"
}
output "db_subnet_1" {
  value = "${element(aws_subnet.database-subnet-1.*.id, 1)}"
}
output "db_subnet_2" {
  value = "${element(aws_subnet.database-subnet-2.*.id, 2)}"
}