output "user_name" {
  value       = module.rds.username
}

output "user_password" {
    value = module.rds.userpassword
}

output "link_to_wordpress_domain" {
    value = module.asg.wordpress_domain
}

output "link_to_rds_writer_instanse" {
    value = module.rds.writer_53
}

output "links_to_rds_reader_instanses" {
    value = module.rds.readers_53
}