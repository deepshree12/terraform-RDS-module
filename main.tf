resource "aws_subnet" "private-subnet-1" {
vpc_id = module.vpc.vpc_id
cidr_block = "10.0.1.0/24"
availability_zone = "ap-southeast-2b"

tags = {

  name = "private-subnet-1"

}
}

resource "aws_subnet" "private-subnet-2" {
vpc_id = module.vpc.vpc_id
cidr_block = "10.0.2.0/24"
availability_zone = "ap-southeast-2c"

tags = {


  name = "private-subnet-2"

}
}

resource "aws_db_subnet_group" "rds_subnet" {
name = "rds-subnet-group1"
description = "rds_subnte_group"
subnet_ids = [

aws_subnet.private-subnet-1.id,
aws_subnet.private-subnet-2.id

]

tags = {

  name = "db-subnet-group"

}

}

resource "aws_security_group" "rds_security_group" {
name = "rds-security-group"
description = "allow postgresql ip"
vpc_id = module.vpc.vpc_id
ingress  {

        from_port = "5432"
        to_port   = "5432"
        protocol = "tcp"
        cidr_blocks = ["10.0.0.0/16"]

}

tags = {

  name = "db-security-group"

}
}

locals {

 major_version_upgrade = split(".", var.engine_version)[0]

}


resource "aws_db_parameter_group" "rds_parameter_grouop" {
name = "rds-parameter-group-${local.major_version_upgrade}"
description = "parameter group for postgresql"
family = "postgres${local.major_version_upgrade}"
parameter {

 name = "log_min_duration_statement"
 value = "10000"

}

parameter {

name = "max_connections"
value = "150"
apply_method = "pending-reboot"
}


lifecycle {

  create_before_destroy = true

}


}

module "database" {

source = "./module/rds/"

identifier = var.identifier
engine = var.engine
engine_version = var.engine_version
instance_class = var.instance_class
storage_type = var.storage_type
allocated_storage = var.allocated_storage
db_name = var.db_name
username = var.username
backup_retention_period = var.backup_retention_period
backup_window = var.backup_window
maintenance_window = var.maintenance_window
db_security_group = [aws_security_group.rds_security_group.id]
db_subnet_group = aws_db_subnet_group.rds_subnet.name
//custom_parameter_group = aws_db_parameter_group.rds_parameter_group.name
custom_parameter_group = aws_db_parameter_group.rds_parameter_grouop.name
apply_immediately = var.apply_immediately
minor_version_upgrade = var.minor_version_upgrade
major_version_upgrade = var.major_version_upgrade
}

module "vpc" {

  source = "./module/vpc"

  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name

}

output "rds_endpoint" {
  value = module.database.db_endpoint
}
