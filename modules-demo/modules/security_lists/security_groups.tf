#    Created by Gleb Otochkin 2021-07-29  #

#TNS*Net Network Security Group

resource "oci_core_network_security_group" "tnsnet_network_security_group" {
    #Required
    compartment_id = var.compartment_ocid
    vcn_id = var.vcn_id
    display_name = "TNSNetNSG"
}

# DataStream Network Security Group Rules
resource "oci_core_network_security_group_security_rule" "tnsnet_nsg_rule_01" {
    #Required
    network_security_group_id = oci_core_network_security_group.tnsnet_network_security_group.id
    direction = "INGRESS"
    protocol = 6
    #Optional
    description = "TNS*Net whitelisted IP 01"
    source = "34.67.6.157/32"
    source_type = "CIDR_BLOCK"
    tcp_options {
        #Optional
        destination_port_range {
            #Required
            max = 1521
            min = 1521
        }
    }
}
resource "oci_core_network_security_group_security_rule" "tnsnet_nsg_rule_02" {
    #Required
    network_security_group_id = oci_core_network_security_group.tnsnet_network_security_group.id
    direction = "INGRESS"
    protocol = 6
    #Optional
    description = "TNS*Net whitelisted IP 02"
    source = "34.67.234.134/32"
    source_type = "CIDR_BLOCK"
    tcp_options {
        #Optional
        destination_port_range {
            #Required
            max = 1521
            min = 1521
        }
    }
}