#    Created by Gleb Otochkin 2021-07-29  #

# Define compute box
resource "oci_core_instance" "moduletest02_instance" {
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.compartment_ocid
  display_name        = "moduletest02"
  shape = "VM.Standard.E3.Flex"
	shape_config {
		memory_in_gbs = "8"
		ocpus = "1"
	}

  create_vnic_details {
    subnet_id        = oci_core_subnet.moduletest02_vcn_subnet_pub.id
    display_name     = "Primaryvnic"
    assign_public_ip = true
    hostname_label   = "moduletest02"
    nsg_ids = [
      tnsnet_network_security_group_id
    ]
  }

    source_details {
    source_type = "image"
    source_id   = var.image_id[var.region]
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }

  timeouts {
    create = "60m"
  }
}
