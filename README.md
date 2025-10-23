# Deprecated

Thank you for your interest in Alibaba Cloud Terraform Module. This Module will be out of maintenance as of today and will be officially taken offline in the future. We recommend you to use [terraform-alicloud-alb](https://registry.terraform.io/modules/terraform-alicloud-modules/alb/alicloud/latest) as an alternative. More available Modules can be searched in [Alibaba Cloud Terraform Module](https://registry.terraform.io/browse/modules?provider=alibaba).

Thank you again for your understanding and cooperation.

Terraform module which creates ALB server group on Alibaba Cloud.

terraform-alicloud-alb-server-group
=====================================================================

English
| [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-alb-server-group/blob/master/README-CN.md)

Terraform module which creates ALB server group on Alibaba Cloud.

These types of resources are supported:

* [Alb_Server_Group](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/alb_server_group)
*

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.131.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.131.0 |

## Usage

```hcl
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
```

Submit Issues
-------------
If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend to open an issue on this repo.

Authors
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)