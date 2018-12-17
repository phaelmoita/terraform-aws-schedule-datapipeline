resource "aws_lambda_function" "lambda_classic" {
  filename         = "${var.lambda_file_name == "" ? "${path.module}/scripts/call_data_pipeline.py.zip" : "${var.lambda_file_name}"}"
  function_name    = "${var.lambda_function_name}"
  role             = "${var.role_arn}"
  handler          = "${var.lambda_handler}"
  source_code_hash = "${base64sha256(file("${var.lambda_file_name == "" ? "${path.module}/scripts/call_data_pipeline.py.zip" : "${var.lambda_file_name}"}"))}"
  runtime          = "${var.lambda_runtime}"
  memory_size      = "${var.lambda_memory_size}"
  timeout          = "${var.lambda_timeout}"

  environment = {
    variables = "${merge(var.environment_variables, map("CreatedBy", "Terraform"))}"
  }

  tags = "${var.tags}"

  count = "${var.is_vpc_lambda == "true" ? 0 : 1}"
}

resource "aws_lambda_function" "lambda_vpc" {
  filename         = "${var.lambda_file_name == "" ? "${path.module}/scripts/call_data_pipeline.py.zip" : "${var.lambda_file_name}"}"
  function_name    = "${var.lambda_function_name}"
  role             = "${var.role_arn}"
  handler          = "${var.lambda_handler}"
  source_code_hash = "${base64sha256(file("${var.lambda_file_name == "" ? "${path.module}/scripts/call_data_pipeline.py.zip" : "${var.lambda_file_name}"}"))}"
  runtime          = "${var.lambda_runtime}"
  memory_size      = "${var.lambda_memory_size}"
  timeout          = "${var.lambda_timeout}"

  vpc_config {
    subnet_ids         = ["${var.subnet_ids}"]
    security_group_ids = ["${var.security_group_ids}"]
  }

  environment = {
    variables = "${merge(var.environment_variables, map("CreatedBy", "Terraform"))}"
  }

  tags = "${var.tags}"

  count = "${var.is_vpc_lambda == "true" ? 1 : 0}"
}

output "lambda-arn" {
  value = "${join("", concat(aws_lambda_function.lambda_vpc.*.arn, aws_lambda_function.lambda_classic.*.arn))}"
}

output "lambda-name" {
  value = "${var.lambda_function_name}"
}