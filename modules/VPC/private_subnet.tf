resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.main.id
  count      = length(var.private_subnets_cidrs)
  cidr_block = element(var.private_subnets_cidrs,   count.index)
  availability_zone = element(var.availability_zones,   count.index)
  tags = {
    Name = "private${format(count.index + 1)}"
    Env  = "Prod"
    Team = "DevOps"
  }
}