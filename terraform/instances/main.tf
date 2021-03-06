module "ansible" {
  source = "modules/"
  count  = 1
  shape  = "VM.Standard1.2"

  freeform_tags = {
    app_name    = "ansible"
    server_role = "control"
    env         = "manage"
  }
}

output "ansible_ip_output" {
  value = "${module.ansible.ip_output}"
}

module "web1" {
  source = "modules/"
  count  = 10
  shape  = "VM.Standard1.1"

  freeform_tags = {
    app_name    = "app1"
    server_role = "web"
    env         = "prod"
  }
}

output "web1_ip_output" {
  value = "${module.web1.ip_output}"
}

module "worker1" {
  source = "modules/"
  count  = 5
  shape  = "VM.Standard2.1"

  freeform_tags = {
    app_name    = "app1"
    server_role = "worker"
    env         = "prod"
  }
}

output "worker1_ip_output" {
  value = "${module.worker1.ip_output}"
}

module "web2" {
  source = "modules/"
  count  = 20
  shape  = "VM.Standard2.2"

  freeform_tags = {
    app_name    = "app2"
    server_role = "web"
    env         = "prod"
  }
}

output "web2_ip_output" {
  value = "${module.web2.ip_output}"
}

module "worker2" {
  source = "modules/"
  count  = 10
  shape  = "VM.Standard2.4"

  freeform_tags = {
    app_name    = "app2"
    server_role = "worker"
    env         = "prod"
  }
}

output "worker2_ip_output" {
  value = "${module.worker2.ip_output}"
}
