# Copyright (c) 2020 Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
# 

#############################################################################################################################
# NOTE: Before use the terraform local or CloudShell, you need to build the binaries of the application.                    #
#       Instructions here: https://github.com/oracle-quickstart/oci-cloudnative/blob/master/deploy/basic/README.md#build    #
#                                                                                                                           #
#       If using Oracle Resource Manager, the stack already include the binaries. ORM does not use the tfvars               #
#############################################################################################################################

# See: https://oracle-quickstart.github.io/oci-micronaut/quickstart/terraform/
# More info: https://micronaut-projects.github.io/micronaut-oracle-cloud/latest/guide/#tracing

# OCI authentication
# TO-DO
tenancy_ocid     = "ocid1.tenancy....."

fingerprint      = "" # e.g.: "5f:53:..." or leave blank if using CloudShell
user_ocid        = "" # e.g.: "ocid1.user..." or leave blank if using CloudShell
private_key_path = "" # e.g.: "/users/user/.oci/oci_api_key.pem" or leave blank if using CloudShell

# Deployment compartment
# TO-DO
compartment_ocid = "ocid1.compartment...."

# region
# TO-DO
region = "us-phoenix-1"

# Compute
num_nodes                           = 2
instance_shape                      = "VM.Standard.E2.1.Micro" # Micro shape for Always-free shape. If want to use flexible, change to "VM.Standard.E3.Flex"
instance_ocpus                      = 1 # instance_ocpus only used when instance_shape is a flex compute shape
instance_shape_config_memory_in_gbs = 16 # instance_shape_config_memory_in_gbs only used when instance_shape is a flex compute shape
instance_visibility                 = "Public"
generate_public_ssh_key             = true
public_ssh_key                      = ""
is_pv_encryption_in_transit_enabled = false

# Network Details
lb_shape                                   = "flexible"
lb_shape_details_minimum_bandwidth_in_mbps = 10
lb_shape_details_maximum_bandwidth_in_mbps = 10
lb_compartment_ocid                        = "" # e.g.: "ocid1.compartment..." 
create_secondary_vcn                       = false

# Autonomous Database
autonomous_database_license_model            = "LICENSE_INCLUDED" # LICENSE_INCLUDED or BRING_YOUR_OWN_LICENSE
autonomous_database_is_free_tier             = true
autonomous_database_visibility               = "Public"
autonomous_database_name                     = "MuShopDB"
autonomous_database_db_version               = "19c"
autonomous_database_cpu_core_count           = 1
autonomous_database_data_storage_size_in_tbs = 1


# Encryption (OCI Vault/Key Management/KMS)
use_encryption_from_oci_vault = false
create_new_encryption_key     = true
encryption_key_id             = ""

# Always Free only or support other shapes
use_only_always_free_elegible_resources = true

# Object Storage
object_storage_mushop_media_compartment_ocid = "" # e.g.: "ocid1.compartment..."
object_storage_mushop_media_visibility       = "Public"

# Tracing
# TO-DO (APM is created first with OCI Resource Manager)
apm_zipkin_enabled = false
apm_zipkin_url = "" # Copy here the APM domain Data Upload Endpoint.
apm_zipkin_path = "" # The format is: /20200101/observations/public-span?dataFormat=zipkin&dataFormatVersion=2&dataKey=<auto_generated_public_key>
