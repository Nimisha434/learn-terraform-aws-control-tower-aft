# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

#provider "aws" {
 #  region = "ap-southeast-1"
 # assume_role {
  #  role_arn = "arn:aws:iam::235216519211:role/aws-service-role/support.amazonaws.com/AWSServiceRoleForSupport"
   # session_name = "default"
  #}
  
#}

module "aft" {
  source = "github.com/aws-ia/terraform-aws-control_tower_account_factory"
  ct_management_account_id    = var.ct_management_account_id
  log_archive_account_id      = var.log_archive_account_id
  audit_account_id            = var.audit_account_id
  aft_management_account_id   = var.aft_management_account_id
  ct_home_region              = var.ct_home_region
  tf_backend_secondary_region = var.tf_backend_secondary_region

  vcs_provider                                  = "github"
  account_request_repo_name                     = "${var.github_username}/learn-terraform-aft-account-request"
  account_provisioning_customizations_repo_name = "${var.github_username}/learn-terraform-aft-account-provisioning-customizations"
  global_customizations_repo_name               = "${var.github_username}/learn-terraform-aft-global-customizations"
  account_customizations_repo_name              = "${var.github_username}/learn-terraform-aft-account-customizations"
}
