output "alb" {
  value = aws_lb.lb
}

output "ecs_service" {
  value = aws_ecs_service.service
}
