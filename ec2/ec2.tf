
#resource <resource-type> <resource-name>

resource "aws_instance" "db"{
    ami="ami-041e2ea9402c46c32"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = "t3.micro"
    

    tags={
        Name = "db"
    }
}
resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "allowing SSH access"

    ingress{
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]        
    }    

    egress{
        from_port        = 0 # from o to 0 means opening for all ports 22  (ssh) 443 (https)
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]        
    }



    tags = {
        Name="allow_ssh"
        CreatedBy="Sivakumar"
    }

}

