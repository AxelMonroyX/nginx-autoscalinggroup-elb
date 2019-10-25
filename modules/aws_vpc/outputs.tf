output "vpc_default_id" {
  value       = "${data.aws_vpc.default.id}"
  description = "Return the default vpc id"
}

output "vpc_default_subnets" {
  value       = "${data.aws_subnet_ids.all.ids}"
  description = "Returns subnets from default vpc"
}


output "vpc_default_cidr" {
  value       = "${data.aws_vpc.default.cidr_block}"
  description = "Returns cidr from default vpc"
}