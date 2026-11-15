module "dev" {
    source = "./infra_app"

    env = "dev"
    bucket_name = "logaom-dev-terraform-2026-x91k"
    table_name = "dev-table"
    hash_key = "lockID"
    instance_name = "dev-instance"
    instance_type = "t3.micro"
    instance_count =1
    ami_id = "ami-0547ecbf0e9b4aeb5"

}

module "prod" {
    source = "./infra_app"

    env = "prod"
    bucket_name = "logaom-prod-terraform-2026-x91k"
    table_name = "prod-table"
    hash_key = "lockID"
    instance_name = "prod-instance"
    instance_type = "t3.micro"
    instance_count =2
    ami_id = "ami-0547ecbf0e9b4aeb5"

}

module "stg" {
    source = "./infra_app"

    env = "stg"
    bucket_name = "logaom-stg-terraform-2026-x91k"
    table_name = "stg-table"
    hash_key = "lockID"
    instance_name = "stg-instance"
    instance_type = "t3.micro"
    instance_count =1
    ami_id = "ami-0547ecbf0e9b4aeb5"

}