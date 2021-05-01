variable "access_key" {
        description = "Access key of AWS IAM user"
}
variable "secret_key" {
        description = "Secret key of AWS IAM user"
}

variable "table_name" {
  description = "Dynamodb table name (space is not allowed)"
  default = "project1table"
}

variable "table_billing_mode" {
  description = "Controls how you are charged for read and write throughput and how you manage capacity."
  default = "PAY_PER_REQUEST"
}


variable "environment" {
  description = "Name of environment"
  default = "project1"
}