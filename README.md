
# Terraform EC2 Environments — Starter Repo

Provision one EC2 instance for each environment (`dev`, `test`, `prod`) using Terraform.
This repo is set up to be run by GitHub Actions (CI/CD).

## Quickstart

1. Create a GitHub repository and push this code.
2. Ensure the following GitHub Secrets are added (Repository → Settings → Secrets & variables → Actions):
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `AWS_REGION`
3. Review key pair / subnet values in `environments/*/main.tf`.
4. On `main` branch pushes, the workflow will run `terraform init`, `plan`, and `apply`.

## Notes

- This starter uses a Terraform data lookup for the latest Amazon Linux 2 AMI (no hardcoded AMI).
- **Free-tier**: instances are `t2.micro` depending on provider; verify instance types and AMIs for free-tier eligibility in your account.
- This repo keeps state locally per environment (no remote backend configured). For a real project, use an S3 backend (and locking).
