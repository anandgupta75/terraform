module "docker4" {
source = "./project7"
env = "dev"
instance_type = "t3.micro"
ami = "ami-00af95fa354fdb788"
}
