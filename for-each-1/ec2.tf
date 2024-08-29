resource "aws_instance" "expense" {
    for_each = var.instance_names #each.key,each.value 
    ami=data.aws_ami.ami_info.id
    vpc_security_group_ids = ["sg-0207c88a92002e4e8"]
    instance_type = each.value
    #Args = values. Values can be straight or through variables.

    tags=merge(var.common_tags,
       {
            Name=each.key
            Module=each.key
       }
    )

}  