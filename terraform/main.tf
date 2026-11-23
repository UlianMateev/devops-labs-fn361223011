terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region                      = "eu-central-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true

  endpoints {
    s3       = var.endpoint
    sqs      = var.endpoint
    dynamodb = var.endpoint
  }
}

variable "endpoint" {
  description = "Where the emulator listens"
  type        = string
  default     = "http://localhost:4566"
}

variable "team" {
  description = "Team name, used in resource names"
  type        = string
}

resource "aws_s3_bucket" "backups" {
  bucket = "${var.team}-backups"
}

resource "aws_sqs_queue" "jobs" {
  name                       = "${var.team}-jobs"
  visibility_timeout_seconds = 60
}

resource "aws_dynamodb_table" "notes" {
  name         = "${var.team}-notes"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

output "bucket" {
  value = aws_s3_bucket.backups.bucket
}

output "queue_url" {
  value = aws_sqs_queue.jobs.url
}