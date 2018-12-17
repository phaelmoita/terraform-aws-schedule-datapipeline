variable "lambda_name" {
  type        = "string"
}

variable "lambda_arn" {
  type        = "string"
  default     = ""
}

variable "schedule_expression" {
  type        = "string"
  description = "Cron expression to execute the lambda"
}

variable "cwrule_name" {
  type        = "string"
  description = "Cron expression to execute the lambda"
}