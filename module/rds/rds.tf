resource "aws_db_instance" "rds_prod" {

identifier = var.identifier
engine = var.engine
engine_version = var.engine_version
instance_class = var.instance_class
storage_type = var.storage_type
allocated_storage = var.allocated_storage
db_name = var.db_name
username = var.username
manage_master_user_password = true
backup_retention_period = var.backup_retention_period
backup_window = var.backup_window
maintenance_window = var.maintenance_window
apply_immediately = var.apply_immediately
vpc_security_group_ids = var.db_security_group
parameter_group_name = var.custom_parameter_group
db_subnet_group_name = var.db_subnet_group
skip_final_snapshot = true

}
