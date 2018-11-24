variable "freeform_tags" {
  type = "map"

  default = {}
}

variable "count" {
  default = 1
}

variable "shape" {
  default = "VM.Standard1.1"
}

variable "image_source_id" {
  # ubuntu 16.04  # default = "ocid1.image.oc1.iad.aaaaaaaaau7nws7rghq6ob22m5hqsf7gugskz7hm53n4tuv3kcpvgwio5kdq"

  # ubuntu 18.04
  default = "ocid1.image.oc1.iad.aaaaaaaapx7m52arfwbm25ka5bqb7dcka64suou5yth7erg3ywgqorvq4doq"

  # oracle linux 7.x
  # default = "ocid1.image.oc1.iad.aaaaaaaa2mnepqp7wn3ej2axm2nkoxwwcdwf7uc246tcltg4li67z6mktdiq"
}

variable "region" {
  default = "us-ashburn-1"
}

variable "private_key_path" {
  default = "~/.oci/oci_api_key.pem"
}

variable "ssh_public_key_file" {
  default = "~/.ssh/id_rsa.pub"
}

provider "oci" {
  version          = ">= 3.0.0"
  tenancy_ocid     = "${var.tenancy_ocid}"
  user_ocid        = "${var.user_ocid}"
  fingerprint      = "${var.fingerprint}"
  private_key_path = "${var.private_key_path}"
  region           = "${var.region}"
}

resource "oci_core_instance" "default" {
  count               = "${var.count}"
  availability_domain = "${var.availability_domain}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "${var.freeform_tags["env"]}_${var.freeform_tags["app_name"]}_${var.freeform_tags["server_role"]}_${count.index}"
  shape               = "${var.shape}"
  subnet_id           = "${var.subnet_id}"

  source_details {
    source_type = "image"
    source_id   = "${var.image_source_id}"
  }

  metadata {
    ssh_authorized_keys = "${file(var.ssh_public_key_file)}"
  }

  freeform_tags = "${var.freeform_tags}"
}

output "ip_output" {
  value = "${oci_core_instance.default.*.public_ip}"
}
