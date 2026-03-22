resource "aws_ec2_transit_gateway" "gp-tgw" {
  description = "GP Transit Gateway"
  tags = {
    Name = "gp-tgw"
  }
}

## Add transit gateway attachments for each VPC
resource "aws_ec2_transit_gateway_vpc_attachment" "gp-tgw-attachment-vpc-1" {
  transit_gateway_id = aws_ec2_transit_gateway.gp-tgw.id
  vpc_id = aws_vpc.gp-vpc[0].id
  subnet_ids = [aws_subnet.gp-subnet-private-vpc-1.id]
  tags = {
    Name = "gp-tgw-attachment-vpc-1"
  } 
}

resource "aws_ec2_transit_gateway_vpc_attachment" "gp-tgw-attachment-vpc-2" {
  transit_gateway_id = aws_ec2_transit_gateway.gp-tgw.id
  vpc_id = aws_vpc.gp-vpc[1].id
  subnet_ids = [aws_subnet.gp-subnet-private-vpc-2.id]
  tags = {
    Name = "gp-tgw-attachment-vpc-2"
  } 
}

resource "aws_ec2_transit_gateway_vpc_attachment" "gp-tgw-attachment-vpc-3" {
  transit_gateway_id = aws_ec2_transit_gateway.gp-tgw.id
  vpc_id = aws_vpc.gp-vpc[2].id
  subnet_ids = [aws_subnet.gp-subnet-private-vpc-3.id]
  tags = {
    Name = "gp-tgw-attachment-vpc-3"
  } 
}

/* Transit gateway route tables and associations can be added here if needed, 
but for simplicity we will rely on the default route table for this example. 
In a production environment, it is recommended to create separate route tables for better control and isolation of routes. */