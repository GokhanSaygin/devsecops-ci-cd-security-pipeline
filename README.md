# DevSecOps CI/CD Security Pipeline

This project demonstrates a DevSecOps CI/CD pipeline using GitHub Actions.  
The pipeline builds a Docker image, scans the image for vulnerabilities with Trivy, and scans Terraform infrastructure code with Checkov before allowing the workflow to pass.

The goal of this project is to show how security checks can be integrated into a CI/CD pipeline before deployment.

---

## Project Overview

This project includes:

- A simple Flask API
- Docker image build process
- GitHub Actions CI/CD pipeline
- Trivy container image vulnerability scanning
- Checkov Terraform security scanning
- Security gate configuration
- Terraform S3 security best practices

---

## Architecture

```text
Developer
   |
   | git push
   v
GitHub Repository
   |
   v
GitHub Actions Runner
   |
   |-- Build Docker Image
   |
   |-- Trivy Image Scan
   |
   |-- Checkov Terraform Scan
   |
   v
Pipeline Pass / Fail