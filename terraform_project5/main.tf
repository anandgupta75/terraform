# Key pair
resource "aws_key_pair" "my_key" {
  key_name   = "terra-key-ec2"
  public_key = file("terra-key4.pub")
}

# Default VPC
resource "aws_default_vpc" "default" {
}

# Security Group
resource "aws_security_group" "my_security_group" {
  name        = "automate-sg"
  description = "Security group for automated EC2 instances"
  vpc_id      = aws_default_vpc.default.id

  # Inbound rule
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "example" {
  for_each = tomap({
    "anand" =  "t3.micro",
    "amit" = "t3.nano"

  })#meta argument
  ami                    = "ami-0f9708d1cd2cfee41"
  instance_type          = each.value
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  user_data = file("user_data.sh")

  root_block_device {
    volume_size = var.env == "prod" ? 20 : var.ec2_root_storage_size
    volume_type = "gp3"
  }

  tags = {
    Name = each.key #here meta argument will be iterated and used here etc
  }
}
