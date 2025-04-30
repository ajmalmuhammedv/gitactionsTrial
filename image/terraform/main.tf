provider "aws" {
  region = "us-east-1"
  shared_credentials_files = ["C:/Users/ajmal/.aws/credentials"]# Set the desired region
}

resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda_numpy_exec_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_logging" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "numpy_lambda" {
  function_name = "lambda_numpy_hello_3"
  role          = aws_iam_role.lambda_exec_role.arn
  package_type  = "Image"
  image_uri     = "762233745169.dkr.ecr.us-east-1.amazonaws.com/lambda-numpy-app:latest"
  timeout       = 10
}