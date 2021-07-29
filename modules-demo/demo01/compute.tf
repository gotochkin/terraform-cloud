#    Created by Gleb Otochkin 2021-07-29  #

# Define compute box
resource "oci_core_instance" "moduletest_instance" {
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.compartment_ocid
  display_name        = "moduletest"
  shape = "VM.Standard.E3.Flex"
	shape_config {
		memory_in_gbs = "8"
		ocpus = "1"
	}

  create_vnic_details {
    subnet_id        = oci_core_subnet.moduletest_vcn_subnet_pub.id
    display_name     = "Primaryvnic"
    assign_public_ip = true
    hostname_label   = "moduletest"
  }

    source_details {
    source_type = "image"
    source_id   = var.database_image_ocid[var.region]
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    /*user_data = base64encode(file("./data/moduletest_instance.cloud-config.yml")) */
  }

  timeouts {
    create = "60m"
  }
}
