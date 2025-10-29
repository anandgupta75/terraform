

resource "aws_default_vpc" "default" {


}
resource "aws_key_pair" "my_ssh_key" {
  key_name   = "my-terraform-key"
  public_key = file("my-aws-key.pub")
}
resource "aws_security_group" "sg6" {
name="${var.env}-security-group"
description = "this is security group for ${var.env}"
vpc_id = aws_default_vpc.default.id

ingress  {

from_port = 22
to_port = 22
cidr_blocks = ["0.0.0.0/0"]
protocol = "tcp"

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
}
}

resource "aws_instance" "my_ec2" {

    ami = var.ami
    instance_type = var.instance_type
    key_name      = aws_key_pair.my_ssh_key.key_name
    #user_data = file("user_data.sh")
   provisioner "remote-exec" {
    inline = [   # Install Docker
      "sudo yum update -y",
      "sudo yum install docker -y",
      "sudo systemctl start docker",
      "sudo systemctl enable docker",
      "sudo usermod -aG docker ec2-user",
      "sudo docker run -d -p 80:80 --name nginx nginx:latest"
     ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("my-aws-key")
      host        = self.public_ip
   }
    
}
}