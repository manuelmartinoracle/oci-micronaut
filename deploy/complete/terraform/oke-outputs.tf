# Copyright (c) 2021 Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
# 

### Important Security Notice ###
# The private key generated by this resource will be stored unencrypted in your Terraform state file. 
# Use of this resource for production deployments is not recommended. 
# Instead, generate a private key file outside of Terraform and distribute it securely to the system where Terraform will be run.
output "generated_private_key_pem" {
  value = var.generate_public_ssh_key ? tls_private_key.oke_worker_node_ssh_key.private_key_pem : "No Keys Auto Generated"
}
output "dev" {
  value = "Made with \u2764 by Oracle Developers"
}
output "comments" {
  value = "The application URL will be unavailable for a few minutes after provisioning while the application is configured and deployed to Kubernetes"
}
output "deploy_id" {
  value = random_string.deploy_id.result
}
output "deployed_to_region" {
  value = var.region
}
output "deployed_oke_kubernetes_version" {
  value = (var.k8s_version == "Latest") ? local.cluster_k8s_latest_version : var.k8s_version
}
output "kubeconfig_for_kubectl" {
  value       = "export KUBECONFIG=./generated/kubeconfig"
  description = "If using Terraform locally, this command set KUBECONFIG environment variable to run kubectl locally"
}
### Important Security Notice ###
# The private key generated by this resource will be stored unencrypted in your Terraform state file. 
# Use of this resource for production deployments is not recommended. 
# Instead, generate a private key file outside of Terraform and distribute it securely to the system where Terraform will be run.
output "generated_private_key_pem" {
  value     = var.generate_public_ssh_key ? tls_private_key.oke_worker_node_ssh_key.private_key_pem : "No Keys Auto Generated"
  sensitive = true
}
