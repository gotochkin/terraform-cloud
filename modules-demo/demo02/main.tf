#    Created by Gleb Otochkin 2021-07-29  #

# Provider and authentication details
provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

data "oci_identity_compartment" "test_compartment" {
    #Required
    id = var.compartment_ocid
}

data "oci_identity_availability_domain" "ad" {
  compartment_id = var.tenancy_ocid
  ad_number      = 1
}

# Modules declaration 

module "security_lists" {
  source = "../modules/security_lists"
  vcn_id = oci_core_vcn.moduletest02_vcn.id
  compartment_ocid = var.compartment_ocid
  security_list_id = oci_core_vcn.moduletest02_vcn.default_security_list_id
}

