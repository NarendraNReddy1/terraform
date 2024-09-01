
#resource <resource-type> <resource-name>

resource "aws_instance" "db"{
    ami=var.ami_id
    vpc_security_group_ids = var.security_id
    instance_type = var.instance_type
    

    tags=var.tags
}

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "allowing SSH access"

    ingress{
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]

    }    

    egress{
        from_port        = 0 # from o to 0 means opening for all ports 22  (ssh) 443 (https)
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
     
    }



    tags = {
        Name="allow_ssh"
        CreatedBy="Sivakumar"
    }

}

