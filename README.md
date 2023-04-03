# Azure Elastic UserSpace and Role Setup
 This module configures the elasticsearch snapshot repository with azure backend and lifecycle policy

[![Elastic-EC-Permissions][welcome\_image]][welcome\_link]
[![Elastic-EC-Permissions][code\_image]][code\_link]
[![Elastic-EC-Permissions][issue\_image]][issues\_link]
[![Elastic-EC-Permissions][doku\_image]][doku\_link]
[![ADR][adr\_image]][adr\_link]
[![Changelog][changelog\_image]][changelog\_link]

[welcome\_link]:             https://gowiki.gothaer.de/display/DA
[code\_link]:                https://aprdgitlab000.analytics.gothaer.de/da/cloud/modules/elastic-workplace
[issues\_link]:              https://aprdgitlab000.analytics.gothaer.de/da/cloud/modules/elastic-workplace/issues
[doku\_link]:                https://www.terraform.io/docs/index.html
[changelog\_link]:           https://aprdgitlab000.analytics.gothaer.de/da/cloud/modules/elastic-workplace/-/blob/main/CHANGELOG.md
[adr\_link]:                 https://aprdgitlab000.analytics.gothaer.de/da/cloud/modules/elastic-workplace/-/blob/main/README.md
[welcome\_image]:            https://img.shields.io/badge/Project-welcome-blue.svg
[code\_image]:               https://img.shields.io/badge/Terraform_CI-code-green.svg
[issue\_image]:              https://img.shields.io/badge/Terraform_CI-issues-red.svg
[doku\_image]:               https://img.shields.io/badge/Terraform_CI-DOKU-yellow.svg
[adr\_image]:                https://img.shields.io/badge/Terraform_CI-ADR-yellow.svg
[changelog\_image]:          https://img.shields.io/badge/Terraform_CI-Changelog-purple.svg

## Documentation

A module to customize your index snapshots

 https://registry.terraform.io/providers/elastic/ec/latest/docs

## Parameters

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_elasticstack"></a> [elasticstack](#requirement\_elasticstack) | 0.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_elasticstack"></a> [elasticstack](#provider\_elasticstack) | 0.5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [elasticstack_elasticsearch_snapshot_lifecycle.this](https://registry.terraform.io/providers/elastic/elasticstack/0.5.0/docs/resources/elasticsearch_snapshot_lifecycle) | resource |
| [elasticstack_elasticsearch_snapshot_repository.this](https://registry.terraform.io/providers/elastic/elasticstack/0.5.0/docs/resources/elasticsearch_snapshot_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_client"></a> [azure\_client](#input\_azure\_client) | Client name during keystore [credentials setup](https://www.elastic.co/guide/en/elasticsearch/reference/current/repository-azure.html) for azure | `string` | `"default"` | no |
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | Name of the Azure container to store backups | `string` | n/a | yes |
| <a name="input_indices"></a> [indices](#input\_indices) | List of indices to backup | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the repository | `string` | n/a | yes |
| <a name="input_schedule"></a> [schedule](#input\_schedule) | When to run the backup. [Cron syntax](https://www.elastic.co/guide/en/elasticsearch/reference/current/api-conventions.html#api-cron-expressions) | `string` | n/a | yes |
| <a name="input_snapshot_expire"></a> [snapshot\_expire](#input\_snapshot\_expire) | When to recycle a snapshot | `string` | `"30d"` | no |
| <a name="input_snapshot_max"></a> [snapshot\_max](#input\_snapshot\_max) | Maximum amount of snapshots to hold | `number` | `25` | no |
| <a name="input_snapshot_min"></a> [snapshot\_min](#input\_snapshot\_min) | Minimum amount of snapshots to hold | `number` | `5` | no |
| <a name="input_snapshot_name"></a> [snapshot\_name](#input\_snapshot\_name) | Snapshot name | `string` | n/a | yes |

## Outputs

No outputs.
