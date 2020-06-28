resource "aws_instance" "example" {
  ami           = data.aws_ami.amazon.image_id
  instance_type = "t2.micro"
  tags          = module.tagging.tags
  root_block_device {
    delete_on_termination = true
  }
}

data "aws_ami" "amazon" {
  most_recent = true
  owners      = ["aws-marketplace"]

  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS*"]
  }

  filter {
    name   = "product-code"
    values = ["*aw0evgkw8e5c1q413zgy5pjce*"]
  }
}

data "aws_dynamodb_table" "tableName" {
  name = "terraform101-state-locks"
}

output "dynamo" {
  value = data.aws_dynamodb_table.tableName.arn
}

module "tagging" {
  source = "../../functions"
  env    = "dev01-us"
}