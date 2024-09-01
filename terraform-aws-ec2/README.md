# Terraform AWS EC2 Module

## Inputs:

* ami_id (Optional): ami_id is optional. Defaul value is 
* security_group_ids (optiona): list of security group ids. Default is 
* instance_type(optinal): Default value is t3.micro
* tags(optiona): default empty

## Outputs:
* public_ip: outputs the public IP of the intsstance created
* private_ip: outputs the privateIP of the instace 