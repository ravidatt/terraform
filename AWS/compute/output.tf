#--compute/output.tf-------

output "server_id" {
    value = "${join(", ",aws_instance.tf_server.*.id)}"
}

output "Server_Ip" {
    value = "${join(", ",aws_instance.tf_server.*.public_ip)}"
}