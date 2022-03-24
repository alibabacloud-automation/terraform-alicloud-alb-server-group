resource "alicloud_alb_server_group" "alb_server_group" {
  count             = var.create ? 1 : 0
  protocol          = var.health_check_protocol
  vpc_id            = var.vpc_id
  server_group_name = var.alb_group_name
  health_check_config {
    health_check_connect_port = var.health_check_connect_port
    health_check_enabled      = var.health_check_enabled
    health_check_host         = var.health_check_host
    health_check_codes        = var.health_check_codes
    health_check_http_version = var.health_check_http_version
    health_check_interval     = var.health_check_interval
    health_check_method       = var.health_check_method
    health_check_path         = var.health_check_path
    health_check_protocol     = var.health_check_protocol
    health_check_timeout      = var.health_check_timeout
    healthy_threshold         = var.healthy_threshold
    unhealthy_threshold       = var.unhealthy_threshold
  }
  sticky_session_config {
    sticky_session_enabled = true
    cookie                 = "tf-testAcc"
    sticky_session_type    = "Server"
  }
  tags = {
    Created = "TF"
  }
  dynamic "servers" {
    for_each = var.ecs_servers
    content {
      server_id   = servers.value["id"]
      port        = var.health_check_connect_port
      server_ip   = servers.value["server_ip"]
      description = servers.value["name"]
      server_type = "Ecs"
      weight      = servers.value["weight"]
    }
  }
}