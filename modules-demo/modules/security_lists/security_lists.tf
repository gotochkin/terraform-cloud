#    Created by Gleb Otochkin 2021-07-29  #

#  Default security list
resource "oci_core_default_security_list" "default_security_list" {
  manage_default_resource_id = var.security_list_id
  display_name               = "defaultSecurityList"

  # allow outbound tcp traffic on all ports
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "6"         #tcp
  }

  # allow outbound udp traffic on a port range
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "17"        # udp
    stateless   = true

    udp_options {
      min = 319
      max = 320
    }
  }

  # allow inbound ssh traffic
  ingress_security_rules {
    protocol  = "6"         # tcp
    source    = "0.0.0.0/0"
    stateless = false

    tcp_options {
      min = 22
      max = 22
    }
  }

  # allow inbound icmp traffic of a specific type
  ingress_security_rules {
    protocol  = 1         #icmp
    source    = "0.0.0.0/0"
    stateless = true

    icmp_options {
      type = 3
      code = 4
    }
  }
   # allow internal network traffic
  ingress_security_rules {
    protocol  = 6         # tcp
    source    = "10.11.0.0/22"
    stateless = false
  }
    # allow all inbound icmp traffic for internal network
  ingress_security_rules {
    protocol  = 1         #icmp
    source    = "10.11.8.0/22"
    stateless = false
  }
}