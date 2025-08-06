terraform {
    required_version = ">1.5.3"
    required_providers {
        aws = {
            source= "hashicorp/aws"
            version= "~>6.0"
        }
    }
    backend "s3" {
        bucket = "my-s3-bucket-040694"
        key = "prod/terraform.tfstate"
        region = "ap-south-1"
        encrypt = true
        use_lockfile = true
    }
}