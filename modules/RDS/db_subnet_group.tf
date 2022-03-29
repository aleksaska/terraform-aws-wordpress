resource "aws_db_subnet_group" "db_subnet" {
    name = "db_subnet"
    subnet_ids     = var.subnet_ids
}