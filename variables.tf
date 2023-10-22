variable "aws_region" {
  description = "The AWS region for the resource"
  type        = string
  default     = "eu-central-1"
}

variable "key_name" {
  description = "The name of the AWS key pair"
  type        = string
  default     = "Agnija_key"
}

variable "ami_id" {
  description = "AMI ID of the instance"
  type        = string
  default     = "ami-08a34e890d3f70022"
}

variable "instance_type" {
  description = "The type of the instance"
  type        = string
  default     = "t2.micro"
}

variable "instance_count" {
  description = "The number of the instances"
  type        = number
  default     = 1
}

variable "iam_instance_profile" {
  description = "The IAM instance profile to attach to the instance"
  type        = string
  default     = "role-d4ml-cloud9-deployment"
}

variable "http_port" {
  description = "http server port"
  type        = number
  default     = 80
}
