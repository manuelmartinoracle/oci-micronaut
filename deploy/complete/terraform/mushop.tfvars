# Copyright (c) 2020, 2021 Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
#

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
region = "us-ashburn-1"

# OKE Cluster

## Cluster Workers visibility
cluster_workers_visibility = "Private"

## Cluster API Endpoint visibility
cluster_endpoint_visibility = "Public"

## create_new_oke_cluster
create_new_oke_cluster         = true
existent_oke_cluster_id        = "" # e.g.: ocid1.cluster.oc1...
create_new_compartment_for_oke = false

## Create Dynamic group and Policies for Autoscaler and OCI Metrics and Logging
create_dynamic_group_for_nodes_in_compartment = true
create_compartment_policies                   = true
create_tenancy_policies                       = true

## Encryption (OCI Vault/Key Management/KMS)
use_encryption_from_oci_vault = false
create_new_encryption_key     = false
existent_encryption_key_id    = "" # e.g.: "ocid1.key.oc1..."

# Enable Cluster Autoscaler
cluster_autoscaler_enabled              = true
cluster_autoscaler_min_nodes            = 3
cluster_autoscaler_max_nodes            = 10
existent_oke_nodepool_id_for_autoscaler = "" # e.g.: ocid1.nodepool.oc1...

# OKE Worker Nodes (Compute)
num_pool_workers                          = 3 # If autoscaler is enabled, uses the value from cluster_autoscaler_min_nodes for the initial node pool number of nodes
node_pool_shape                           = "VM.Standard.E3.Flex"
node_pool_node_shape_config_ocpus         = 1
node_pool_node_shape_config_memory_in_gbs = 16
generate_public_ssh_key                   = true # if true, auto generate public and private keys and assign to the node pool.
public_ssh_key                            = ""   # if generate_public_ssh_key=true, public_ssh_key is ignored. if generate_public_ssh_key=false, assign public_ssh_key, that can be nothing if ""

# Ingress Loadbalancer
ingress_nginx_enabled                = true
ingress_load_balancer_shape          = "flexible" # Flexible, 10Mbps, 100Mbps, 400Mbps or 8000Mps
ingress_load_balancer_shape_flex_min = "10"
ingress_load_balancer_shape_flex_max = "100"
ingress_hosts                        = "" # Optional. If you have multiple domain names, include separated by comma. e.g.: mushop.example.com,catshop.com
cert_manager_enabled                 = true
ingress_tls                          = false
ingress_cluster_issuer               = "letsencrypt-staging" # Values examples: letsencrypt-prod, letsencrypt-staging and selfsigned
ingress_email_issuer                 = "no-reply@mushop.ateam.cloud"

# MuShop

# Newsletter
create_oracle_function_newsletter = false
newsletter_function_approved_email_address = "" # e.g. "micronaut-newsletter@mushop.com"

# Streaming
create_oracle_streaming_service_stream = false

# APM - Update: Now the terraform provider for APM is already available - See: "apm.tf"
apm_display_name = "APM-Domain-Test-01"
apm_description  = "APM Test 01 - A domain to demo APM with Micronaut"

# Tracing
# TO-DO (Deprecated: APM is created first with OCI Resource Manager)
apm_zipkin_enabled = false
apm_zipkin_url = "" # Copy here the APM domain Data Upload Endpoint.
apm_zipkin_path = "" # The format is: /20200101/observations/public-span?dataFormat=zipkin&dataFormatVersion=2&dataKey=<APM DOMAIN PUBLIC DATA KEY>

## Common Services (MuShop Utilities)
grafana_enabled        = true
prometheus_enabled     = true
metrics_server_enabled = true
catalog_enabled        = false
