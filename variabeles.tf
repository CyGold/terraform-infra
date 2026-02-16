variable "resource_group_name" {
  type        = string
  description = "Resource group name"
    default     ="women-techsters"
}

variable "location" {
  type        = string
  default     = "East U"
}

variable "static_web_app_name" {
  type = string
}

variable "sku_tier" {
  type    = string
  default = "Free"
}

variable "sku_size" {
  type    = string
  default = "Free"
}
variable "subscription_id" {
  type    = string
  default = ""
}
