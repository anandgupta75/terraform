variable "ec2_instance_type"{
    default="t3.micro"
    type=string
}

variable "ec2_root_storage_size"{

    type=number
    default=15
}

variable "env" {

    type=string
    default = "prod"
}