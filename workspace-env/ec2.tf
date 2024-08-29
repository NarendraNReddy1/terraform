resource "aws_instance" "db" {
    ami="ami-041e2ea9402c46c32"
    vpc_security_group_ids = ["sg-0207c88a92002e4e8"]
    instance_type = lookup(var.instance_names,terraform.workspace)
    #Args = values. Values can be straight or through variables.

    tags={
        Name="db"
    }

}  