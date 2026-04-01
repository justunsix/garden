---
filetags: ":snippets:epubnote:terraform:iac:"
id: fcf890d9-149a-4c8c-80c8-ab2e2417fad8
title: Terraform Snippets
---

``` shell

# Initialize a new or existing Terraform configuration:
terraform init

# Install the latest module and provider versions allowed within configured constraints
terraform init -upgrade

# Verify that the configuration files are syntactically valid
terraform validate

# Format configuration according to Terraform language style conventions:
terraform fmt

# Generate and show an execution plan
terraform plan

# Plan Terraform deployment and output plan and apply plan
terraform plan -out=tfplan
terraform apply tfplan

# Build or change infrastructure:
terraform apply

# Destroy all infrastructure in the current directory
terraform destroy
# Destroy without confirmation
terraform destroy -auto-approve

# Output, See all
terraform output

# Output, see specific one
terraform output load_balancer_url

```
