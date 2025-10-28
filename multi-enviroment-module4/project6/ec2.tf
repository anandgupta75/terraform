resource "aws_instance" "my_ec2" {
   ami = var.ec2_ami_id
   instance_type = "t3.micro"

root_block_device {
  volume_size = var.env == "prod" ? 20 : var.ec2_default_size
}
}

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "my_sg5" {
name = "${var.env}-infra-apps-etc"
description = "this is security group etc"
vpc_id = aws_default_vpc.default.id

#ingress etc
ingress {

    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "ssh open"
}

ingress {

    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]


}
egress {

    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "this is open port etc"
}

}

