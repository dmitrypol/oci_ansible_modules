module "ansible" {
  source             = "modules/"
  instance_pool_size = 0

  freeform_tags = {
    app_name    = "ansible"
    server_role = "control"
    env         = "manage"
  }
}

module "web1" {
  source             = "modules/"
  instance_pool_size = 0

  freeform_tags = {
    app_name    = "app1"
    server_role = "web"
    env         = "prod"
  }
}

module "worker1" {
  source             = "modules/"
  instance_pool_size = 0

  freeform_tags = {
    app_name    = "app1"
    server_role = "worker"
    env         = "prod"
  }
}

module "web2" {
  source             = "modules/"
  instance_pool_size = 0

  freeform_tags = {
    app_name    = "app2"
    server_role = "web"
    env         = "prod"
  }
}

module "worker2" {
  source             = "modules/"
  instance_pool_size = 0

  freeform_tags = {
    app_name    = "app2"
    server_role = "worker"
    env         = "prod"
  }
}
