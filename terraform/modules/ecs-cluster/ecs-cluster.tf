resource aws_ecs_cluster ecs_cluster {
  name = "${var.project}-${var.ecs_cluster_name}-cluster-${var.env}"

  tags = {
    Name  = "${var.project}-${var.ecs_cluster_name}-cluster-${var.env}"
    Type  = var.ecs_cluster_type
    Stage = var.env
  }
}
