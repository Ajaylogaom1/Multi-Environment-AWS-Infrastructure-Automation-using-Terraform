
variable "env" {
    description = "The environment for the bucket"
    type = string
}

variable "bucket_name" {
    description = "The name of the bucket"
    type = string
}

variable "table_name" {
    description = "The name of the DynamoDB table"
    type = string
}

variable "hash_key" {
    description = "The hash key for the DynamoDB table"
    type = string
}
variable "instance_type" {
    description = "The type of EC2 instance"
    type = string
}
variable "instance_count" {
    description = "The number of EC2 instances to create"
    type = number
}
variable "ami_id" {
    description = "The ID of the AMI to use for the EC2 instance"
    type = string
}
variable "instance_name" {
    description = "The name of the EC2 instance"
    type = string
}