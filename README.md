# Docker CI/CD Pipeline with GitHub Actions

A lightweight DevOps project demonstrating application containerization using **Docker**, automated CI/CD workflows using **GitHub Actions**, and Infrastructure as Code (IaC) configuration using **Terraform**.

---

## 🛠️ Tech Stack & Features

* **Containerization:** Docker
* **CI/CD Pipeline:** GitHub Actions (Automated Docker Build on Push)
* **Web Server:** Nginx (Alpine)
* **IaC Configuration:** Terraform (GCP configuration files included for reference)

---

## 📁 Project Structure

```text
docker-cicd-project/
├── .github/
│   └── workflows/
│       └── docker-build.yml    # GitHub Actions workflow for automated Docker build
├── terraform/
│   ├── main.tf                 # Terraform IaC configuration for GCP VM
│   └── .gitignore              # Ignores Terraform state and binaries
├── Dockerfile                  # Container blueprint
├── index.html                  # Simple web application
└── README.md                   # Project documentation

##🚀 How to Run Locally
# Build Docker image
docker build -t my-web-app .

# Run container on port 8080
docker run -d -p 8080:80 --name web-container my-web-app

Open your browser and navigate to http://localhost:8080

🔄 CI/CD Automation

This repository uses GitHub Actions for Continuous Integration:

#Triggers automatically on every push or pull_request to the main branch.
#Builds the Docker image inside an ubuntu-latest runner to verify code stability.