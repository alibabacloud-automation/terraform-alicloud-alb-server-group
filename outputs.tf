output "this_alb_server_group_id" {
  description = "The ID of ALB server group."
  value       = concat(alicloud_alb_server_group.alb_server_group.*.id, [""])[0]
}
