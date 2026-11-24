# Project 18: GitOps Infrastructure Deployment

## Description

Implemented a GitOps-based infrastructure deployment pipeline using GitHub Actions, Terraform, and AWS. Automated infrastructure updates through Pull Request (PR) merges into the main branch.

Configured GitHub Actions workflows to execute Terraform Plan during Pull Requests and Terraform Apply after PR merges. Integrated AWS IAM Roles with GitHub OIDC authentication to enable secure, temporary access to AWS without storing permanent AWS access keys.

Configured a GitHub production environment with required reviewers to introduce manual approval before infrastructure deployment.

## Objectives

- Automate infrastructure deployment using GitOps principles.
- Trigger infrastructure updates from Pull Request merges.
- Configure Terraform Plan and Apply jobs using GitHub Actions.
- Implement approval requirements before production deployment.
- Integrate GitHub Actions with AWS using OIDC authentication.
- Manage Terraform state remotely using Amazon S3.

## Architecture

```text
Developer
    |
    v
Feature Branch
    |
    v
Pull Request
    |
    v
GitHub Actions
    |
    v
Terraform Plan
    |
    v
Merge into Main
    |
    v
Production Approval
    |
    v
GitHub OIDC Authentication
    |
    v
AWS IAM Role
    |
    v
Terraform Apply
    |
    v
AWS S3 Infrastructure
```

## Technologies Used

- AWS
- Amazon S3
- AWS IAM
- AWS OIDC
- Terraform
- Git
- GitHub
- GitHub Actions
- GitHub Environments
- YAML
- Linux

## Project Structure

```text
project-18-gitops-infra-deployment/
│
├── .github/
│   └── workflows/
│       └── terraform.yml
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── screenshots/
│
├── trust-policy.json
├── permissions-policy.json
└── README.md
```

## Implementation

### 1. Terraform Infrastructure

Created AWS infrastructure using Terraform, including an S3 bucket with:

- Bucket versioning enabled.
- Server-side encryption.
- Public access blocked.
- Resource tagging.

### 2. Remote Terraform State

Configured an Amazon S3 bucket to store Terraform state remotely.

Enabled:
- Bucket versioning.
- Server-side encryption.
- Public access blocking.
- Terraform state locking using S3 lockfiles.

### 3. AWS OIDC Authentication

Configured GitHub as an AWS OIDC identity provider.

Created an IAM role named `Project18-GitOps-Role` and attached a custom IAM permissions policy.

This allows GitHub Actions to obtain temporary AWS credentials through role assumption instead of storing permanent AWS access keys.

### 4. GitHub Actions Workflow

Created a GitHub Actions workflow to automate Terraform operations.

**Terraform Plan:**
- Triggered when a Pull Request is opened or updated.
- Initializes Terraform.
- Checks formatting and configuration validity.
- Generates an infrastructure execution plan.

**Terraform Apply:**
- Triggered after a Pull Request is merged into the main branch.
- Uses the production GitHub environment.
- Waits for the required approval.
- Applies infrastructure changes to AWS.

### 5. Production Approval

Configured a GitHub Environment named `production` with required reviewers.

This introduces a manual approval checkpoint before production infrastructure deployment.

## Security Practices

- Used AWS OIDC instead of permanent AWS access keys.
- Restricted IAM trust to the project GitHub repository.
- Applied least-privilege IAM permissions for project resources.
- Enabled S3 encryption and versioning.
- Blocked public access to the Terraform state bucket.
- Added manual production deployment approval.

## Verification

The following items are used to verify project completion:

- Successful Terraform initialization and validation.
- Successful Terraform Plan execution.
- Pull Request merge into the main branch.
- Production approval checkpoint.
- Successful Terraform Apply execution.
- Verification of the deployed AWS S3 infrastructure.

## Deliverables

- GitHub repository containing Terraform configuration.
- GitHub Actions workflow configuration.
- AWS IAM OIDC integration.
- Production environment approval configuration.
- Successful GitHub Actions workflow run screenshot.

## GitHub Repository

[Project 18 - GitOps Infrastructure Deployment](https://github.com/Amish-kumar-08/project-18-gitops-infra-deployment)

