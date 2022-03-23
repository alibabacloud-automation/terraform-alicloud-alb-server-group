variable "name" {
  default = "example_value"
}

data "alicloud_zones" "default" {
  available_disk_category     = "cloud_efficiency"
  available_resource_creation = "VSwitch"
}

data "alicloud_instance_types" "default" {
  availability_zone = data.alicloud_zones.default.zones[0].id
  cpu_core_count    = 1
  memory_size       = 2
}

data "alicloud_images" "default" {
  name_regex  = "^ubuntu_18.*64"
  most_recent = true
  owners      = "system"
}

resource "alicloud_vpc" "default" {
  vpc_name   = var.name
  cidr_block = "172.16.0.0/16"
}

resource "alicloud_vswitch" "default" {
  vpc_id       = alicloud_vpc.default.id
  cidr_block   = "172.16.0.0/16"
  zone_id      = data.alicloud_zones.default.zones[0].id
  vswitch_name = var.name
}

resource "alicloud_security_group" "default" {
  name   = var.name
  vpc_id = alicloud_vpc.default.id
}

resource "alicloud_instance" "default" {
  image_id                   = data.alicloud_images.default.images[0].id
  instance_type              = data.alicloud_instance_types.default.instance_types[0].id
  instance_name              = var.name
  security_groups            = alicloud_security_group.default.*.id
  internet_charge_type       = "PayByTraffic"
  internet_max_bandwidth_out = "10"
  availability_zone          = data.alicloud_zones.default.zones[0].id
  instance_charge_type       = "PostPaid"
  system_disk_category       = "cloud_efficiency"
  vswitch_id                 = alicloud_vswitch.default.id
}

module "example" {
  create                    = true
  alb_group_name            = "tf_group_name"
  source                    = "../.."
  vpc_id                    = alicloud_vpc.default.id
  health_check_connect_port = 80
  health_check_host         = "tf-testAcc.com"
  health_check_codes        = ["http_2xx", "http_3xx", "http_4xx"]
  health_check_interval     = 2
  health_check_path         = "/tf-testAcc"
  health_check_timeout      = 5
  healthy_threshold         = 3
  unhealthy_threshold       = 3
  ecs_servers               = [
    { id = alicloud_instance.default.id, name = alicloud_instance.default.instance_name, weight = 100 }
  ]
}