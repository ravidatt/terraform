provider "aws" {
  region = "${var.aws_region}"
}


# Deploy Storage Resource
module "storage" {
  source       = "./storage"
  project_name = "${var.project_name}"
}

# Deploy Networking Resources

module "networking" {
  source       = "./networking"
  vpc_cidr     = "${var.vpc_cidr}"
  public_cidrs = "${var.public_cidrs}"
  accessip     = "${var.accessip}"
}

module "compute" {
  source       = "./compute"
  key_name     = "${var.key_name}"
  public_key_path = "${var.public_key_path}"
}


