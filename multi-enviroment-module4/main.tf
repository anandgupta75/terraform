module "dev_infra" {

    source = "./project6"
    env="dev"
    bucket_name = "anand-bucket"
    ec2_ami_id = "ami-00af95fa354fdb788"
    hash_key="studentID"
    ec2_default_size = 10
    }

module "prod_infra" {

    source = "./project6"
    env="prod"
    bucket_name = "anand-bucket4"
    ec2_ami_id = "ami-00af95fa354fdb788"
    hash_key="studentID"
    ec2_default_size = 10
    }

module "stage_infra" {

    source = "./project6"
    env="stage"
    bucket_name = "anand-bucket"
    ec2_ami_id = "ami-00af95fa354fdb788"
    hash_key="studentID"
    ec2_default_size = 10
    }
