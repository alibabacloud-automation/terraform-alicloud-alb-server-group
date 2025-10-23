# 下线公告

感谢您对阿里云 Terraform Module 的关注。 即日起，本 Module 将停止维护并会在将来正式下线。推荐您使用 [terraform-alicloud-alb](https://registry.terraform.io/modules/terraform-alicloud-modules/alb/alicloud/latest) 作为替代方案。更多丰富的 Module 可在 [阿里云 Terraform Module](https://registry.terraform.io/browse/modules?provider=alibaba) 中搜索获取。

再次感谢您的理解和合作。

terraform-alicloud-alb-server-group
=====================================================================

本 Module 用于在阿里云创建一个[应用型负载均衡(ALB)](https://help.aliyun.com/document_detail/250240.html)服务器分组.

本 Module 支持创建以下资源:

* [应用型负载均衡服务器分组(Alb_Server_Group)](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/alb_server_group)

## 版本要求

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.131.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.131.0 |

## 用法

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

提交问题
------
如果在使用该 Terraform Module
的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

作者
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

许可
----
Apache 2 Licensed. See LICENSE for full details.

参考
---------

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)