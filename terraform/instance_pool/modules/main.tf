variable "freeform_tags" {
  type = "map"

  default = {}
}

variable "instance_pool_size" {
  default = "1"
}

variable "region" {
  default = "us-ashburn-1"
}

variable "private_key_path" {
  default = "~/.oci/oci_api_key.pem"
}

terraform {
  required_version = ">= 0.11.11"
}

provider "oci" {
  version          = ">= 3.11.0"
  tenancy_ocid     = "${var.tenancy_ocid}"
  user_ocid        = "${var.user_ocid}"
  fingerprint      = "${var.fingerprint}"
  private_key_path = "${var.private_key_path}"
  region           = "${var.region}"
}

resource "oci_core_instance_pool" "default" {
  compartment_id            = "${var.compartment_id}"
  instance_configuration_id = "${var.instance_configuration_id}"

  placement_configurations {
    availability_domain = "${var.availability_domain}"
    primary_subnet_id   = "${var.subnet_id}"
  }

  size = "${var.instance_pool_size}"

  display_name = "${var.freeform_tags["env"]}_${var.freeform_tags["app_name"]}_${var.freeform_tags["server_role"]}_pool"

  freeform_tags = "${var.freeform_tags}"
}
