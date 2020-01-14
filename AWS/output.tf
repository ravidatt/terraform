output "Bucket Name" {

  value = "${module.storage.bucketname}"
    
}

#---networking outputs ----------

output "public subnets" {

  value = "${join("," ,module.networking.public_subnets)}"
    
}

output "Subnet Ips" {

  value = "${module.networking.public_sg}"
    
}

output "Public Security Group" {

  value= "${join("," ,module.networking.subnet_ips)}"
    
}

output "public instance Ids" {

  value = "${module.compute.server_id}"
    
}

output "public instance IPs" {

  value = "${module.compute.Server_Ip}"
    
}