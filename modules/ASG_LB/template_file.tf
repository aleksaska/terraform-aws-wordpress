data "template_file" "user_data" {
  template = file("${path.module}/templates/user_data.tpl")
  vars = {
    db_username      = var.username
    db_user_password = var.userpassword
    db_name          = var.dbname
    db_RDS           = var.cluster_endpoint
  }
}