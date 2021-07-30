# terraform-cloud
For terraform demo configurations and tests in Oracle Cloud Infrastructure (OCI)
You will need OCI related environment variables setup. 
Here is an example of the file with variables:

export TF_VAR_tenancy_ocid=ocid1.tenancy.oc1..aaaaaaaaq....
export TF_VAR_user_ocid=ocid1.user.oc1..aaaaaaaaa...
export TF_VAR_compartment_ocid=ocid1.compartment.oc1..aaaaaaaa...
export TF_VAR_fingerprint=$(cat ~/.oci/oci_api_key_fingerprint) #I put it in the file - you can export it explicitely
export TF_VAR_private_key_path=~/.oci/oci_api_key.pem
export TF_VAR_ssh_public_key=$(cat ~/.ssh/id_rsa.pub) #I've used the cat command to put it to the variable
export TF_VAR_ssh_private_key=$(cat ~/.ssh/id_rsa)  #Only if you use it (optional)
export TF_VAR_region=ca-toronto-1

modules-demo - Terraform modules tests
    modules - directory for modules
    demo01 - simplest module demo 
