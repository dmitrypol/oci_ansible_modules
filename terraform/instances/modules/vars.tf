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
  # ubuntu 16.04    
  # default = "ocid1.image.oc1.iad.aaaaaaaaau7nws7rghq6ob22m5hqsf7gugskz7hm53n4tuv3kcpvgwio5kdq"

  # ubuntu 18.04
  # default = "ocid1.image.oc1.iad.aaaaaaaapx7m52arfwbm25ka5bqb7dcka64suou5yth7erg3ywgqorvq4doq"

  # custom ubuntu 18.04 w nginx and redis installed and stopped via Packer
  default = "ocid1.image.oc1.iad.aaaaaaaadx25j6b4jofh3warvmw4hbquyba3lanwte5r37mqitmqxlonf6qa"

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
