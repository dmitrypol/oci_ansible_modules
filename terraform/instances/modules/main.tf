resource "oci_core_instance" "default" {
  count               = "${var.count}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "${var.freeform_tags["env"]}_${var.freeform_tags["app_name"]}_${var.freeform_tags["server_role"]}_${count.index}"
  shape               = "${var.shape}"
  availability_domain = "${element(var.availability_domains, count.index)}"
  subnet_id           = "${element(var.subnet_ids, count.index)}"

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
