#    Created by Gleb Otochkin 2021-07-29  #

# Output

output "primary_ip_addresses" {
  value = [
    oci_core_instance.moduletest_instance.public_ip
  ]
}