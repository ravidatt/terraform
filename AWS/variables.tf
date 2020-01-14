variable "aws_region" {}

#------ storage variables

variable "project_name" {}

#-------networking variables

variable "vpc_cidr" {}

variable "public_cidrs" {
  type = "list"
}

variable "accessip" {}

variable key_name {}

variable public_key_path {}