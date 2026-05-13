resource "random_id" "random" {

byte_length = 4

}

resource "aws_s3_bucket" "random_s3_bucket" {

bucket = "random-s3-bucket-${random_id.random.hex}"

}
