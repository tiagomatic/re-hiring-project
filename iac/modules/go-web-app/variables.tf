variable "app_name" {
  description = "Name of the application"
  default     = "go-web-app"
}

variable "image_tag" {
  description = "The tag of the image"
  type        = string
}

variable "subnet_ids" {
  description = "The IDs of the subnets"
  type        = list(string)
  default     = null
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
  default     = null
}
