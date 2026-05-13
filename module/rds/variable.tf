variable "identifier" {
type = string
description = "name of the identifer"

}

variable "engine" {
type = string
description = "name of the engine"

}

variable "engine_version" {
type = number
description = "engine version"

}

variable "storage_type" {
type = string
description = "type of the storage"

}

variable "allocated_storage" {
type = number
description = "number of storage allocated"

}

variable "username" {
type = string
description = "name of the user"

}

variable "db_name" {
type = string
description = "name of the database"

}

variable "backup_retention_period" {
type = number
description = "number of backups available"

}

variable "backup_window" {
type = string
description = "backup window"

}

variable "maintenance_window" {
type = string
description = "maintenance window"

}

/*
variable "kms_key" {
type = string
description = "kms key"

}
*/

variable "db_subnet_group" {
type = string
description = "db subnet group"

}

variable "db_security_group" {

type = list(string)
description = "database security group"

}

variable "custom_parameter_group" {
type = string
description = "database custom parameter group"

}

variable "apply_immediately" {
type = bool
description = "apply immedieatly"

}

variable "instance_class" {
type = string
description = "instance_class"

}
