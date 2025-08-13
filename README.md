# AWS Infrastructure Automation with Terraform and CloudFormation  

## Project Overview  
This project is part of **PROG 8870 – Final Project**.  
I deployed AWS infrastructure using **Terraform** and **CloudFormation** following Infrastructure as Code (IaC) practices.  

The setup includes:  
- **S3 Buckets** (private, versioning enabled)  
- **EC2 Instance** in a custom VPC  
- **RDS MySQL Database** in a dedicated subnet group  
- Both **Terraform** and **CloudFormation** were used.  

---

## Tools & Services Used  
- Terraform  
- CloudFormation (YAML)  
- AWS Academy Lab  
- PowerShell / AWS CLI  

---

## Project Structure  

### Terraform  
- `terraform/s3` → 4 private S3 buckets  
- `terraform/ec2` → VPC, subnet, internet gateway, security group, EC2 instance  
- `terraform/rds` → MySQL RDS in DB subnet group  

**Each files have:**  
- `main.tf` – main configuration  
- `variables.tf` – variable definitions  
- `terraform.tfvars` – variable values
- `provider.tf` – AWS provider settings  
- `backend.tf` – local backend config  

---

### CloudFormation  
- `s3.yaml` → 3 private S3 buckets with versioning  
- `ec2.yaml` → EC2 with VPC, subnet, IGW, route table  
- `rds.yaml` → MySQL RDS with public access (for project)  

---

## How to Run  

First configure AWS to powershell using:

- `$env:aws_access_key_id=""` - to set AWS access key ID
- `$env:aws_secret_access_key=""` - to set AWS secret access key
- `$env:aws_session_token=""` - to set AWS session token
- `$env:aws_region="us-east-1"` -> to set AWS region
- `$env:aws_default_output="json"` -> to set AWS output format

- `aws sts get-caller-identity`    -> to verify AWS credentials

## Screenshots

- all the Screenshots and Code Snippetes are inlcuded in `Final_Individual_Project.pdf` File.

### Terraform  
```powershell
terraform init
terraform plan
terraform apply

### Cloudformation 

- Go to AWS Console → CloudFormation
- Create stack → Upload .yaml file
- Create and verify resources