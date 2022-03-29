resource "aws_eip" "ngw-eip" {
  vpc = true
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.ngw-eip.id
  subnet_id     = element(aws_subnet.public_subnet.*.id, 0)

  depends_on = [aws_internet_gateway.igw]
  tags = local.tags
}