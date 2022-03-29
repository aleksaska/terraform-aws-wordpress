locals  {
    writer = "${element(aws_rds_cluster_instance.wordpress_instanse.*.writer, 0) == true ? element(aws_rds_cluster_instance.wordpress_instanse.*.endpoint, 0) :
        (element(aws_rds_cluster_instance.wordpress_instanse.*.writer, 1) == true ? element(aws_rds_cluster_instance.wordpress_instanse.*.endpoint, 1) :
        (element(aws_rds_cluster_instance.wordpress_instanse.*.writer, 2) == true ? element(aws_rds_cluster_instance.wordpress_instanse.*.endpoint, 2) :
        element(aws_rds_cluster_instance.wordpress_instanse.*.endpoint, 3)))}"

    all_instanses = tolist(aws_rds_cluster_instance.wordpress_instanse.*.endpoint)
    reader_instanses = toset([
        for x in local.all_instanses:
        x if x != local.writer
    ])
}

resource "aws_route53_record" "writer" {
    zone_id = var.ZONEID
    name    = "writer.${var.DOMAIN}"
    type    = "CNAME"
    ttl     = "300"
    records = [local.writer]
}

resource "aws_route53_record" "readers" {
    count = var.number_of_instanses -1
    zone_id = var.ZONEID
    name    = "reader${count.index +1}.${var.DOMAIN}"
    type    = "CNAME"
    ttl     = "300"
    records = [element(local.reader_instanses[*], count.index)]
}