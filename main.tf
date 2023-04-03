/**
 * # Azure Elastic UserSpace and Role Setup
 *  This module configures the elasticsearch snapshot repository with azure backend and lifecycle policy
 *
 * [![Elastic-EC-Permissions][welcome_image]][welcome_link]
 * [![Elastic-EC-Permissions][code_image]][code_link]
 * [![Elastic-EC-Permissions][issue_image]][issues_link]
 * [![Elastic-EC-Permissions][doku_image]][doku_link]
 * [![ADR][adr_image]][adr_link]
 * [![Changelog][changelog_image]][changelog_link]
 *
 * [welcome_link]:             https://gowiki.gothaer.de/display/DA
 * [code_link]:                https://aprdgitlab000.analytics.gothaer.de/da/cloud/modules/elastic-workplace
 * [issues_link]:              https://aprdgitlab000.analytics.gothaer.de/da/cloud/modules/elastic-workplace/issues
 * [doku_link]:                https://www.terraform.io/docs/index.html
 * [changelog_link]:           https://aprdgitlab000.analytics.gothaer.de/da/cloud/modules/elastic-workplace/-/blob/main/CHANGELOG.md
 * [adr_link]:                 https://aprdgitlab000.analytics.gothaer.de/da/cloud/modules/elastic-workplace/-/blob/main/README.md
 * [welcome_image]:            https://img.shields.io/badge/Project-welcome-blue.svg
 * [code_image]:               https://img.shields.io/badge/Terraform_CI-code-green.svg
 * [issue_image]:              https://img.shields.io/badge/Terraform_CI-issues-red.svg
 * [doku_image]:               https://img.shields.io/badge/Terraform_CI-DOKU-yellow.svg
 * [adr_image]:                https://img.shields.io/badge/Terraform_CI-ADR-yellow.svg
 * [changelog_image]:          https://img.shields.io/badge/Terraform_CI-Changelog-purple.svg
 *
 * ## Documentation
 *
 * A module to customize your index snapshots
 *
 *  https://registry.terraform.io/providers/elastic/ec/latest/docs
 *
 * ## Parameters
 *
 */

/*
* Creates a snapshot repository connected to an azure data storage container
* https://www.elastic.co/guide/en/elasticsearch/reference/current/snapshots-register-repository.html
* Setting up credentials:
* https://www.elastic.co/guide/en/elasticsearch/reference/current/repository-azure.html
* var.client must match the name from the configuration process
*/
resource "elasticstack_elasticsearch_snapshot_repository" "this" {
  name = var.name

  azure {
    container = var.container_name
    compress  = true
    client    = var.azure_client
  }
}

/*
* Defines a snapshot lifecycle policy. When to execute a snapshot, what to backup and how many to keey
* https://www.elastic.co/guide/en/elasticsearch/reference/current/snapshot-lifecycle-management-api.html
*/
resource "elasticstack_elasticsearch_snapshot_lifecycle" "this" {
  name = var.name

  schedule      = var.schedule
  snapshot_name = var.snapshot_name
  repository    = elasticstack_elasticsearch_snapshot_repository.this.name

  indices              = var.indices
  ignore_unavailable   = false
  include_global_state = false

  expire_after = var.snapshot_expire
  min_count    = var.snapshot_min
  max_count    = var.snapshot_max
}