resource "aws_instance" "db" {
    ami="ami-041e2ea9402c46c32"
    vpc_security_group_ids = ["sg-0207c88a92002e4e8"]
    instance_type = "t3.micro"
    #Args = values. Values can be straight or through variables.


    provisioner "local-exec" {
    command = "echo ${self.private_ip} > private_ips.txt" #aws_instance db
  }

#   provisioner "local-exec" {
#     command="ansible-plabook -i private_ips.txt web.yaml"
    
#   }

    connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

   provisioner "remote-exec" {
    inline = [
        "sudo dnf install ansible -y",
        "sudo dnf install nginx -y",
            "sudo systemctl start nginx"

    ]
  }

}  