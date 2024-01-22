module "go_web_app" {
  source = "../../modules/go-web-app"
  image_tag = "dev"
  app_name = "go-web-app"
}
