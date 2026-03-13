resource "aws_vpc" "gp-vpc" {
    for_each = var.vpc_cidr_blocks
    cidr_block = each.value
    tags = {
        Name = "gp-vpc-${each.key}"
    }
}

##### Create subnets for each VPC ########

resource "aws_subnet" "gp-subnet-public-vpc-1" {
    vpc_id = aws_vpc.gp-vpc[0].id
    cidr_block = var.vpc_subnets[0]
    availability_zone = "ap-south-1a"
    tags = {
        Name = "gp-subnet-public-vpc-1"
    }     
}

resource "aws_subnet" "gp-subnet-private-vpc-1" {
    vpc_id = aws_vpc.gp-vpc[0].id
    cidr_block = var.vpc_subnets[1]
    availability_zone = "ap-south-1b"
    tags = {
        Name = "gp-subnet-private-vpc-1"
    }     
}

resource "aws_subnet" "gp-subnet-private-vpc-2" {
    vpc_id = aws_vpc.gp-vpc[1].id
    cidr_block = var.vpc_subnets[2]
    availability_zone = "ap-south-1a"
    tags = {
        Name = "gp-subnet-private-vpc-2"
    }     
}

resource "aws_subnet" "gp-subnet-private-vpc-3" {
    vpc_id = aws_vpc.gp-vpc[2].id
    cidr_block = var.vpc_subnets[3]
    availability_zone = "ap-south-1a"
    tags = {
        Name = "gp-subnet-private-vpc-3"
    }     
}

### Create Route Table for each subnet ######
resource "aws_route_table" "gp-public-rt" {
  vpc_id = aws_vpc.gp-vpc[0].id
  tags = {
    Name = "gp-public-rt"
  }
}

resource "aws_route_table" "gp-private-rt" {
  vpc_id = aws_vpc.gp-vpc[0].id
  tags = {
    Name = "gp-private-rt"
  }
}

resource "aws_route_table" "gp-private-rt-vpc-2" {
  vpc_id = aws_vpc.gp-vpc[1].id
  tags = {
    Name = "gp-private-rt-vpc-2"
  }
}

resource "aws_route_table" "gp-private-rt-vpc-3" {
  vpc_id = aws_vpc.gp-vpc[2].id
  tags = {
    Name = "gp-private-rt-vpc-3"
  }
}

### Associate route tables with subnets ######
resource "aws_route_table_association" "gp-public-rt-association" {
  subnet_id = aws_subnet.gp-subnet-public-vpc-1.id
  route_table_id = aws_route_table.gp-public-rt.id
}

resource "aws_route_table_association" "gp-private-rt-association" {
  subnet_id = aws_subnet.gp-subnet-private-vpc-1.id
  route_table_id = aws_route_table.gp-private-rt.id
}

resource "aws_route_table_association" "gp-private-rt-vpc-2-association" {
  subnet_id = aws_subnet.gp-subnet-private-vpc-2.id
  route_table_id = aws_route_table.gp-private-rt-vpc-2.id
}

resource "aws_route_table_association" "gp-private-rt-vpc-3-association" {
  subnet_id = aws_subnet.gp-subnet-private-vpc-3.id
  route_table_id = aws_route_table.gp-private-rt-vpc-3.id
}

### route to internet gateway for public subnet ######
resource "aws_internet_gateway" "gp-igw" {
  vpc_id = aws_vpc.gp-vpc[0].id
  tags = {
    Name = "gp-igw"
  }
}   

resource "aws_route" "gp-public-rt-internet-route" {
  route_table_id = aws_route_table.gp-public-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gp-igw.id
}

### Add routes to private route tables to route to transit gateway ######
resource "aws_route" "gp-private-rt-tgw-route" {
  route_table_id = aws_route_table.gp-private-rt.id
  for_each = var.vpc_cidr_blocks
  destination_cidr_block = each.value
}