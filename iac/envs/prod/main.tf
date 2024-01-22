module "go_web_app" {
  source = "../../modules/go-web-app"
  image_tag = "prod"
  app_name = "go-web-app"
}
