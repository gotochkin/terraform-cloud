#    Created by Gleb Otochkin 2021-07-29  #

# Define VCN
resource "oci_core_vcn" "moduletest02_vcn" {
  cidr_block     = var.vcn_cidr_block
  dns_label      = "moduletestvcn02"
  compartment_id = var.compartment_ocid
  display_name   = "moduletest02_vcn"
}

# A regional subnet will not specify an Availability Domain
#Public subnet
resource "oci_core_subnet" "moduletest02_vcn_subnet_pub" {
  cidr_block        = var.pub_sub_cidr_block
  display_name      = "moduletest02_vcn_subnet_pub"
  dns_label         = "moduletestvcn1"
  compartment_id    = var.compartment_ocid
  vcn_id            = oci_core_vcn.moduletest02_vcn.id
}

#Internet gateway
resource "oci_core_internet_gateway" "moduletest02_internet_gateway" {
  compartment_id = var.compartment_ocid
  display_name   = "moduletest02InternetGateway"
  vcn_id         = oci_core_vcn.moduletest02_vcn.id
}

#Default route table
resource "oci_core_default_route_table" "default_route_table" {
  manage_default_resource_id = oci_core_vcn.moduletest02_vcn.default_route_table_id
  display_name               = "defaultRouteTable"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.moduletest02_internet_gateway.id
  }
}