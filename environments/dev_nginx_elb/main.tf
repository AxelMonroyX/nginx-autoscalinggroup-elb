data "http" "my_ip" {
  url = "http://ipv4.icanhazip.com"
}

module "amis" {
  source = "../../modules/amis"
}

module "vpc" {
  source = "../../modules/aws_vpc"
}

resource "aws_key_pair" "key_access_asg_nginx_example" {
  key_name   = "key_access_asg_nginx_example"
  public_key = "${file("../../common/ssh/key_access_asg_nginx_example.pub")}"
}

module "asg_example_elb" {
  source               = "../../modules/asg_elb"
  environment          = "${var.environment}"
  instance_type        = "t2.micro"
  size                 = 3
  allow_ssh_cidr_block = "${chomp(data.http.my_ip.body)}/32"
  ami                  = "${module.amis.ami_ubuntu_18_04}"
  vpc_id               = "${module.vpc.vpc_default_id}"
  vpc_subnets          = ["${module.vpc.vpc_default_subnets}"]
  vpc_elb_subnets      = ["${module.vpc.vpc_default_subnets}"]
  key_name             = "${aws_key_pair.key_access_asg_nginx_example.key_name}"
}
