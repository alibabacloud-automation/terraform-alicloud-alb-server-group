variable "vpc_id" {
  type        = string
  description = "The VPC ID of instances belong to."
}

variable "alb_group_name" {
  default     = null
  type        = string
  description = "The name of ALB group."
}

variable "ecs_servers" {
  type = list(object({
    id        = string
    name      = string
    weight    = number
    server_ip = string
  }))
  description = "Ecs servers which bind to alb group."
}

variable "health_check_connect_port" {
  description = "The port of health check."
  type        = number
  default     = null
}

variable "health_check_enabled" {
  description = "Whether enable health check."
  type        = bool
  default     = true
}

variable "health_check_host" {
  description = "The host of health check"
  type        = string
  default     = null
}

variable "health_check_codes" {
  description = "The codes of health check."
  type        = list(string)
  default     = []
}

variable "health_check_http_version" {
  description = "The version of http protocol."
  type        = string
  default     = "HTTP1.1"
}

variable "health_check_interval" {
  description = "The interval of health check"
  type        = number
  default     = null
}

variable "health_check_method" {
  description = "The http method of health check."
  type        = string
  default     = "HEAD"
}

variable "health_check_path" {
  description = "The http path of health check."
  type        = string
  default     = null
}

variable "health_check_protocol" {
  description = "The http protocol of health check."
  type        = string
  default     = "HTTP"
}

variable "health_check_timeout" {
  description = "The timeout of health check"
  type        = number
  default     = null
}

variable "healthy_threshold" {
  description = "The good threshold of health check"
  type        = number
  default     = null
}

variable "unhealthy_threshold" {
  description = "The bad threshold of health check"
  type        = number
  default     = null
}

variable "create" {
  description = "Whether to create resources in module."
  type        = bool
  default     = false
}
