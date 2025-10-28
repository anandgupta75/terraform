variable "env" {

    description = "this is the enviroment value etc"
    type=string
}

variable "bucket_name" {
    description = "the bucket name etc"
    type = string
  
}

variable "ec2_default_size" {

    description = "this is default root size etc"
    type = number
}

variable hash_key {
    description = "this is hash key value etc"
    type = string
}

variable "ec2_ami_id" {

    description = "this is ec2 ami id etc"
    type = string
}