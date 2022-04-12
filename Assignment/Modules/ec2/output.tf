output "webserver1" {
  value = "${element(aws_instance.webserver1.*.id, 1)}"
}
output "webserver2" {
  value = "${element(aws_instance.webserver2.*.id, 2)}"
}
output "websg" {
  value = "${element(aws_security_group.webserver-sg.*.id, 1)}"
}