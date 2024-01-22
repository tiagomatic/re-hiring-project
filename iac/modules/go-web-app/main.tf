locals {
  ecr_image_url = "${aws_ecr_repository.app_repository.repository_url}:${var.image_tag}"

  vpc_id        = var.vpc_id != null ? var.vpc_id : data.aws_vpc.default.id

  subnet_ids    = var.subnet_ids != null ? var.subnet_ids : data.aws_subnets.default.ids
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}
