variable "name" {
  type        = string
  description = "Name of the repository"
}

variable "container_name" {
  type        = string
  description = "Name of the Azure container to store backups"
}

variable "indices" {
  type        = list(string)
  default     = ["*"]
  description = "List of indices to backup"
}

variable "schedule" {
  type        = string
  description = "When to run the backup. [Cron syntax](https://www.elastic.co/guide/en/elasticsearch/reference/current/api-conventions.html#api-cron-expressions)"
}

variable "snapshot_name" {
  type        = string
  description = "Snapshot name"
}

variable "snapshot_expire" {
  type        = string
  default     = "30d"
  description = "When to recycle a snapshot"
}

variable "snapshot_min" {
  type        = number
  default     = 5
  description = "Minimum amount of snapshots to hold"
}

variable "snapshot_max" {
  type        = number
  default     = 25
  description = "Maximum amount of snapshots to hold"
}

variable "azure_client" {
  type        = string
  default     = "default"
  description = "Client name during keystore [credentials setup](https://www.elastic.co/guide/en/elasticsearch/reference/current/repository-azure.html) for azure"
}