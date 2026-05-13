resource "aws_vpc" "new-vpc" {

cidr_block = var.vpc_cidr

tags = {

 name = var.vpc_name

}


}
