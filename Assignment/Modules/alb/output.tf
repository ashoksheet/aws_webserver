output "sg" {
  value = "${element(aws_security_group.web-sg.*.id, 1)}"
}