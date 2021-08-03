#    Created by Gleb Otochkin 2021-07-29  #

#   Variables 
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "compartment_ocid" {}
variable "ssh_public_key" {}
variable "ssh_private_key" {}

variable "vcn_cidr_block" {
  default =  "10.11.10.0/25"
}
variable "pub_sub_cidr_block" {
  default =  "10.11.10.0/27"
}

variable "image_id" {
  type = map
  default = {
    # See https:#docs.cloud.oracle.com/iaas/images/
    # Oracle-provided image "Oracle-Linux-7.9-2021.01.12-0"
    us-phoenix-1 = "ocid1.image.oc1.phx.aaaaaaaaptdwhdot3iosccxikn3oqb3l2qew7c5mcryixlulpn4diszgncfq"
    us-ashburn-1 = "ocid1.image.oc1.iad.aaaaaaaaqdc7jslbtue7abhwvxaq3ihvazfvihhs2rwk2mvciv36v7ux5sda"
    eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa5w2lrmsn6wpjn7fbqv55curiarwsryqhoj4dw5hsixrl37hrinja"
    ca-toronto-1 = "ocid1.image.oc1.ca-toronto-1.aaaaaaaafrnmvd4uopmz6vj36rqpifvigzb3khhrcjvendo6bf5aqaghsoia"
  }
}

