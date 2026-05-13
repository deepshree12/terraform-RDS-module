output "vpc" {
value = module.vpc.vpc_id
description = "display main vpc id"
}

output "subntet-1" {
value = aws_subnet.private-subnet-1.id

}

output "subnet-2" {

value = aws_subnet.private-subnet-2.id

}

output "subnet_group" {

value = aws_db_subnet_group.rds_subnet.name
}

output "security_group" {
value = aws_security_group.rds_security_group.id

}

output "parameter_group" {
value = aws_db_parameter_group.rds_parameter_grouop.name

}

output "s3-bucket-name" {

  value = aws_s3_bucket.random_s3_bucket.bucket

}
