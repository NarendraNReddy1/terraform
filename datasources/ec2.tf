resource "aws_instance" "db" {

    ami = data.aws_ami.ami_id.id
    vpc_security_group_ids = ["sg-0207c88a92002e4e8"]
    instance_type = "t3.micro"
    tags = {
        Name = "data-source-practice"
    }
}