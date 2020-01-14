#--compute/main.tf-------

data "aws_ami" "server_ami" {
    
    most_recent=true
    owners  = ["amazon"]
    
    
    filter {
        name="name"
        values = ["amzn-ami-hvm*-x86_64-gp2"]
    }
    
}

resource "aws_key_pair" "tf_auth" {
    key_name = "${var.key_name}"
    public_key= "${file(var.public_key_path)}"
}


resource "aws_instance" "tf_server" {
    count = "${var.instance_count}"
    instance_type = "${var.instance_type}"
    ami = "${data.aws_ami.server_ami.id}"
    
    tags {
        Name = "tf_server-${count.index+1}"
    }
    
    key_name = "${aws_key_pair.tf_auth.id}"
    
    vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
    
    subnet_id = "${element(var.subnet_id,count.index)}"
    
    user_data = ""
    
    
    
}





