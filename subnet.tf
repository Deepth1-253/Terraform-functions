resource "aws_subnet" "public-subnet" {
  #count             = 3       -- for 3 subnets
  # automate the subnet count based on subnet cidr
  count             = length(var.public_subnet_cidr)
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(var.public_subnet_cidr, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name        = "var.public_subnet_cidr[count.index+1]"
    owner       = local.owner
    costcenter  = local.costcenter
    TeamDL      = local.TeamDL
    environment = var.environment
  }
}

resource "aws_subnet" "private-subnet" {
  count             = length(var.private_subnet_cidr)
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(var.private_subnet_cidr, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name        = "var.private_subnet_cidr[count.index+1]"
    owner       = local.owner
    costcenter  = local.costcenter
    TeamDL      = local.TeamDL
    environment = var.environment
  }
}
