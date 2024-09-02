resource "aws_instance" "db"{
    ami=var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = var.security_id

    tags=var.tags

}    
resource "aws_security_group" "allow_ssh" {
    name="allow_ssh"
    description = "allow_ssh"

    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
  }

    tags={
        Name="allow_ssh"
        CreatedBy="NNR"
    }
}