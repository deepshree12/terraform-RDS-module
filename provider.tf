terraform {

backend "s3" {

bucket = "random-s3-bucket-4b58a604"
key = "prod/terraform.tfstate"
region = "ap-southeast-2"


}


}


provider "aws" {

region = "ap-southeast-2"

}
