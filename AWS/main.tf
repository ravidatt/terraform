provider "aws" {
  region = "${var.aws_region}"
}

terraform {
  backend "s3" {
    bucket = "la-lab-terraform-state"
    key = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
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
  source          = "./compute"
  key_name        = "${var.key_name}"
  public_key_path = "${var.public_key_path}"
  instance_count  = "${var.instance_count}"
  instance_type   = "${var.server_instance_type}"
  subnets         = "${module.networking.public_subnets}"
  security_group  = "${module.networking.public_sg}"
  subnet_ips      = "${module.networking.subnet_ips}"
}
