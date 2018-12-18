#Terraform AWS Schedule DataPipeline

With this simple module, datapipelines can be scheduled on cloudwatch using cron.

```
module "lambda_call_datapipeline_example" {

  source = "git::https://github.com/phaelmoita/terraform-aws-schedule-datapipeline.git/modules/lambda-function"

  lambda_function_name = "DpExample"

  lambda_description = ""

  lambda_runtime = "python3.6"

  lambda_handler = "call_data_pipeline.lambda_handler"

  lambda_memory_size = "128"

  lambda_timeout = "60"

  tags = {}

  environment_variables = {
    DATA_PIPELINE_IP = "df-000000000000XXXXXXXX"
  }

  role_arn = "${data.aws_iam_role.lambda_role.arn}"
  
  is_vpc_lambda = "false"
  
}
```

```
module "cloudwatch_event_datapipeline_example" {

  source = "git::https://github.com/phaelmoita/terraform-aws-schedule-datapipeline.git/modules/cloudwatch-event-rule"

  lambda_name = "${module.lambda_call_datapipeline_example.lambda-name}"

  lambda_arn = "${module.lambda_call_datapipeline_example.lambda-arn}"

  cwrule_name = "DpExample"

  schedule_expression = "cron(00 11-22 ? * MON-FRI *)"

}
```
