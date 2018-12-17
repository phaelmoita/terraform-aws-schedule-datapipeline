variable "lambda_function_name" {
  description = "Lambda function name"
  default     = "lambda_pipeline"
}

variable "lambda_description" {
  type        = "string"
  description = "Description of what the lambda does"
  default     = ""
}

variable "lambda_file_name" {
  description = "Lambda file name"
  default     = ""
}

variable "lambda_runtime" {
  type        = "string"
  description = "Runtime of the lambda"
  default     = "python3.6"
}

variable "lambda_handler" {
  type        = "string"
  description = "Handler of the function"
  default     = "exports.default"
}

variable "lambda_memory_size" {
  type        = "string"
  description = "Lambda memory size"
  default     = "128"
}

variable "lambda_timeout" {
  type        = "string"
  description = "Lambda timeout value"
  default     = "300"
}

variable "environment_variables" {
  type        = "map"
  description = "Environment variables for the lambda"
  default     = {}
}

variable "tags" {
  type        = "map"
  description = "Tags associated with the lambda"
  default     = {}
}

variable "subnet_ids" {
  type        = "list"
  description = "Subnet ids associated with the lambda"
  default     = []
}

variable "security_group_ids" {
  type        = "list"
  description = "Security group ids associated with the lambda"
  default     = []
}

variable "role_arn" {
  type        = "string"
  default     = ""
}

variable "is_vpc_lambda" {
  type        = "string"
  description = "True of false to indicate whether this lambda is executed within VPC or not"
  default     = "false"
}