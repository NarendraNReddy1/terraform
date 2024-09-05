resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = var.enable_dns_hostnames


  tags = merge(var.common_tags,
                var.vpc_tags,
       {
          Name=local.resource_name
       }         
  )
}    

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = merge(var.common_tags,
                var.igw_tags,
          {
            Name=local.resource_name
          }      
  )
}

## PUBLIC SUBNET
resource "aws_subnet" "public" {
  count=length(var.public_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidrs[count.index]
  availability_zone = local.azs[count.index]
  map_public_ip_on_launch = true

  tags=merge(
    var.common_tags,
    var.public_subnet_cidrs_tags,
    {
      Name="${var.project_name}-public-${local.azs[count.index]}"
    }
  )
}


### PRIVATE SUBNET
resource "aws_subnet" "private" {
  count=length(var.private_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidrs[count.index]
  availability_zone = local.azs[count.index]
  map_public_ip_on_launch = false

  tags=merge(
    var.common_tags,
    var.private_subnet_cidrs_tags,
    {
      Name="${var.project_name}-private-${local.azs[count.index]}"
    }
  )
}


### Database SUBNET
resource "aws_subnet" "database" {
  count=length(var.database_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_subnet_cidrs[count.index]
  availability_zone = local.azs[count.index]
  map_public_ip_on_launch = false

  tags=merge(
    var.common_tags,
    var.database_subnet_cidrs_tags,
    {
      Name="${var.project_name}-database-${local.azs[count.index]}"
    }
  )
}

### ELASTIC IP
resource "aws_eip" "nat" {
  domain   = "vpc"
}


### NAT GATEWAY
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id

  tags = merge(var.common_tags,
                var.nat_gateway_tags,
                {
                  Name=local.resource_name #expense-dev
                }
  )

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}



### AWS route table
### PUBLIC route table

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags =merge(var.common_tags, 
               var.public_route_table_tags,
               {
                Name="${local.resource_name}-public" #expense-dev
               }
  )
}

### PRIVATE ROUTE TABLE
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags =merge(var.common_tags, 
               var.private_route_table_tags,
               {
                Name="${local.resource_name}-private" #expense-dev
               }
  )
}


# DATABASE ROUTE TABLE
resource "aws_route_table" "database" {
  vpc_id = aws_vpc.main.id

  tags =merge(var.common_tags, 
               var.database_route_table_tags,
               {
                Name="${local.resource_name}-database" #expense-dev
               }
  )
}


#public route to IGW
resource "aws_route" "public_route" {
  route_table_id            = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
}


#PRIVATE ROUTE TO NAT
resource "aws_route" "private_route" {
  route_table_id            = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat.id
}


### DATABASE ROUTE TO NAT

resource "aws_route" "database_route" {
  route_table_id            = aws_route_table.database.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat.id
}


## ROUTE TABLE to public SUBNET association
resource "aws_route_table_association" "public" {
  count=length(var.public_subnet_cidrs)
  subnet_id      = element(aws_subnet.public[*].id,count.index)
  route_table_id = aws_route_table.public.id
}

## ROUTE TABLE to private SUBNET association
resource "aws_route_table_association" "private" {
  count=length(var.private_subnet_cidrs)
  subnet_id      = element(aws_subnet.private[*].id,count.index)
  route_table_id = aws_route_table.private.id
}

## ROUTE TABLE to database SUBNET association
resource "aws_route_table_association" "database" {
  count=length(var.database_subnet_cidrs)
  subnet_id      = element(aws_subnet.database[*].id,count.index)
  route_table_id = aws_route_table.database.id
}


