resource "aws_instance" "db" {
    ami=var.image_id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = var.instance_type
    #Args = values. Values can be straight or through variables.

    tags=var.tags

}    

resource "aws_security_group" "allow_ssh" {
  name=var.sg_name
  description = var.sg_description

  ingress {
    from_port        = var.ssh_port
    to_port          = var.ssh_port
    protocol         = var.tcp_port
    cidr_blocks      = var.allowed_cidr
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.allowed_cidr

  }

  tags={
    Name="allow_ssh"
  }
}    