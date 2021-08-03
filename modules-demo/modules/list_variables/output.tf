#    Created by Gleb Otochkin 2021-07-29  #

# Output
output "tnsnet_network_security_group_id" {
  description = "tnsnet_network_security_group ocid"
  value       = oci_core_network_security_group.tnsnet_network_security_group.id
}