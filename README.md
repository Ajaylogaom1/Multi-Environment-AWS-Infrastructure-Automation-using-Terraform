# Multi-Environment AWS Infrastructure Automation using Terraform

## 🚀 Project Overview

This project demonstrates Infrastructure as Code (IaC) and multi-environment infrastructure provisioning on Amazon Web Services (AWS) using **Terraform**.

The goal is to create a reusable infrastructure architecture that supports three separate environments:

- **Development (DEV)** – For application development and testing.
- **Staging (STG)** – For pre-production testing and validation.
- **Production (PROD)** – For production workloads.

Terraform is used to provision AWS infrastructure through reusable modules. Ansible is included in the planned configuration-management architecture to automate application and server configuration across environments.

## 🏗️ Architecture

![Multi-Environment AWS Architecture](docs/architecture.png)

### Architecture Components

**1. DevOps Engineer**
- Manages Terraform configuration files.
- Executes infrastructure provisioning commands.
- Maintains infrastructure code in GitHub.

**2. Terraform (Infrastructure as Code)**
- Provisions AWS infrastructure using reusable Terraform modules.
- Uses a common module for DEV, STG and PROD.
- Maintains separate environment configurations.

**3. AWS Environments**

The project provisions three independent environments:

| Environment | EC2 Instance Type | Instance Count |
|---|---|---:|
| Development | t3.micro | 1 |
| Staging | t3.micro | 1 |
| Production | t3.micro | 2 |


**5. Remote State Management**

The project uses AWS storage and locking resources for Terraform state management:

- Amazon S3 – Terraform state storage.
- Amazon DynamoDB – State locking to prevent concurrent Terraform operations.

## 🛠️ Technology Stack

| Technology | Purpose |
|---|---|
| AWS | Cloud infrastructure |
| Terraform | Infrastructure as Code |
| Ansible | Configuration management (planned) |
| Amazon EC2 | Compute resources |
| Amazon VPC | Network isolation |
| Amazon S3 | Remote state storage |
| DynamoDB | Terraform state locking |
| Security Groups | Network traffic control |
| Git & GitHub | Version control |

## 📂 Project Structure

```text
terraform-infra-app/
│
├── infra_app/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── main.tf
├── provider.tf
├── terraform.tf
├── .terraform.lock.hcl
├── .gitignore
└── README.md
```

The `infra_app` directory contains the reusable Terraform module, while the root `main.tf` calls the module separately for each environment.

## ⚙️ How It Works

The root configuration calls the same Terraform module three times:

```hcl
module "dev" {
  source = "./infra_app"
  env    = "dev"

  instance_name  = "dev-instance"
  instance_type  = "t3.micro"
  instance_count = 1
}

module "stg" {
  source = "./infra_app"
  env    = "stg"

  instance_name  = "stg-instance"
  instance_type  = "t3.micro"
  instance_count = 1
}

module "prod" {
  source = "./infra_app"
  env    = "prod"

  instance_name  = "prod-instance"
  instance_type  = "t3.micro"
  instance_count = 2
}
```

Each module receives environment-specific variables and provisions the corresponding infrastructure.

## 📋 Prerequisites

Install the following tools:

- AWS CLI
- Terraform
- Git
- Ansible (when implementing configuration management)

Configure AWS credentials:

```bash
aws configure
```

Verify installations:

```bash
aws --version
terraform --version
git --version
```

## 🚀 Terraform Deployment

**Step 1: Clone the repository**

```bash
git clone https://github.com/Ajaylogaom1/terraform-infra-app.git
cd terraform-infra-app
```

**Step 2: Initialize Terraform**

```bash
terraform init
```

**Step 3: Format Terraform files**

```bash
terraform fmt -recursive
```

**Step 4: Validate configuration**

```bash
terraform validate
```

**Step 5: Review infrastructure changes**

```bash
terraform plan
```

**Step 6: Deploy infrastructure**

```bash
terraform apply
```

Review the execution plan and type `yes` when prompted.

## 🔒 Security and Best Practices

- Use Terraform modules to maintain reusable infrastructure code.
- Keep environment configurations separate.
- Store Terraform state remotely in S3 when the backend is configured.
- Use DynamoDB locking where configured for state coordination.
- Never commit Terraform state files to GitHub.
- Never hardcode AWS credentials.
- Use appropriate IAM permissions.
- Review Terraform plans before applying infrastructure changes.

## 🧹 Infrastructure Cleanup

To avoid unnecessary AWS charges, destroy the infrastructure when it is no longer required.

```bash
terraform destroy
```

Review the destruction plan before confirming.

**Note:** Ensure that shared backend resources and state storage are protected from accidental deletion.

## 👨‍💻 Author

**Ajay**

Cloud & DevOps Engineering Project

GitHub: [Ajaylogaom1](https://github.com/Ajaylogaom1)

**Repository:** [terraform-infra-app](https://github.com/Ajaylogaom1/terraform-infra-app)
