output "dns_name" {
  value = "${aws_elb.nginx_example_elb.dns_name}"
  description = "IP for access to SSH"
}