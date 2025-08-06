locals {
    my_ami = "ami-0f918f7e67a3323f0"
    my_instance_type = "t2.micro"
}



# resource"aws_instance" "frontend" {
#     ami = local.my_ami
#     instance_type = var.instance_type
#     key_name = var.key_pair_name
#      tags = {
#         Name = "dsk"
#      }
# }



resource "aws_s3_bucket" "backend_s3" {
bucket = var.bucket_name
}

resource "aws_s3_bucket_versioning" "enable_versioning" {
    bucket = aws_s3_bucket.backend_s3.id
    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "enable_encryption" {
    bucket= aws_s3_bucket.backend_s3.id
    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
        }
    }
}

resource aws_instance "new_imported_ec2" {

}
    

