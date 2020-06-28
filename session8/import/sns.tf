resource "aws_sns_topic" "user_updates" {
  name = "user-updates-topic"
}

resource "aws_sqs_queue" "terraform_queue" {
  name = "terraform-example-queue"
}

resource "aws_security_group" "webserver_sg" {
  name = "qa-webserver-sg"
}