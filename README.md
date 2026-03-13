# 🚀 AWS Multi-VPC Transit Gateway Network (Terraform)

![Terraform](https://img.shields.io/badge/IaC-Terraform-7B42BC?style=for-the-badge\&logo=terraform)
![AWS](https://img.shields.io/badge/Cloud-AWS-FF9900?style=for-the-badge\&logo=amazonaws)
![Networking](https://img.shields.io/badge/Architecture-Transit%20Gateway-blue?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

A **production-style AWS networking architecture** built using **Terraform Infrastructure as Code (IaC)** that demonstrates how to connect **multiple VPCs through AWS Transit Gateway using a hub-and-spoke model**.

This project showcases how enterprises can build **scalable, centralized, and secure network connectivity between multiple AWS VPCs** while avoiding the complexity of **full mesh VPC peering**.

---

# 📌 Project Overview

Modern cloud environments often require multiple VPCs for **environment isolation, microservices, or organizational segmentation**. Managing connectivity between these VPCs can become complex.

This repository demonstrates how to implement a **Transit Gateway architecture using Terraform**, enabling centralized routing and simplified network management.

Key goals of this project:

* Demonstrate **AWS networking best practices**
* Implement **Infrastructure as Code**
* Build **scalable multi-VPC architecture**
* Enable **inter-VPC communication using Transit Gateway**

---

# 🏗 Architecture

This architecture follows a **Hub-and-Spoke model**.

* **Transit Gateway acts as the Hub**
* **Multiple VPCs act as Spokes**

One VPC contains **public and private subnets**, while additional VPCs contain **private workloads only**.

```
                     Internet
                        │
                 ┌─────────────┐
                 │  Internet   │
                 │   Gateway   │
                 └──────┬──────┘
                        │
                ┌───────────────┐
                │     VPC 1     │
                │ Public Subnet │
                │ PrivateSubnet │
                └──────┬────────┘
                       │
                ┌───────────────┐
                │ TransitGateway│
                └───┬───────┬───┘
                    │       │
            ┌──────────┐ ┌──────────┐
            │  VPC 2   │ │  VPC 3   │
            │ Private  │ │ Private  │
            │ Subnets  │ │ Subnets  │
            └──────────┘ └──────────┘
```

---

# ⚙️ Infrastructure Components

This Terraform project provisions the following AWS resources:

### 🌐 Networking

* Amazon VPCs
* Public and Private Subnets
* Internet Gateway
* Route Tables

### 🔗 Connectivity

* AWS Transit Gateway
* Transit Gateway Attachments
* Transit Gateway Route Tables
* Inter-VPC Routing

### 🔐 Security

* Network segmentation using private subnets
* Controlled internet access through public subnets

---

# 📂 Repository Structure

```
gp-vpc-tgw-network
│
├── provider.tf        # AWS provider configuration
├── variables.tf       # Input variables
│
├── vpc.tf             # VPC and subnet creation
├── tgw.tf             # Transit Gateway configuration
├── versions.tf          # terraform versions
│
└── README.md
```

---

# 🧰 Prerequisites

Ensure the following tools are installed before deploying the infrastructure.

### 1️⃣ Terraform

Required version:

```
Terraform >= 1.3
```

Download Terraform:

https://developer.hashicorp.com/terraform/downloads

---

### 2️⃣ AWS CLI

Install AWS CLI and configure credentials.

```
aws configure
```

Provide:

```
AWS Access Key
AWS Secret Key
Region
Output format
```

---

# 🚀 Deployment Guide

## 1️⃣ Clone Repository

```
git clone https://github.com/KarthikKunchala23/gp-vpc-tgw-network.git
cd gp-vpc-tgw-network
```

---

## 2️⃣ Initialize Terraform

```
terraform init
```

This downloads required providers and modules.

---

## 3️⃣ Validate Configuration

```
terraform validate
```

---

## 4️⃣ Review Infrastructure Plan

```
terraform plan
```

This shows resources Terraform will create.

---

## 5️⃣ Deploy Infrastructure

```
terraform apply
```

Type:

```
yes
```

Terraform will provision the entire AWS network architecture.

---

# 🔍 Verification

After deployment, verify the following resources in the **AWS Console**:

* VPCs
* Subnets
* Internet Gateway
* Transit Gateway
* Transit Gateway Attachments
* Route Tables

You can test connectivity by launching EC2 instances in different VPCs and verifying **inter-VPC communication through the Transit Gateway**.

---

# 🧹 Cleanup

To destroy all created resources:

```
terraform destroy
```

---

# 💡 Why Transit Gateway?

Without Transit Gateway:

* VPC Peering requires **full mesh connectivity**
* Routing becomes complex
* Hard to scale

With Transit Gateway:

✔ Centralized routing
✔ Scalable architecture
✔ Simplified network topology
✔ Better operational management

---

# 🛠 Potential Improvements

Future enhancements for this project:

* Add **NAT Gateway for private subnet outbound traffic**
* Implement **AWS Network Firewall**
* Add **VPC Flow Logs**
* Create **Terraform modules for reusable infrastructure**
* Implement **multi-region Transit Gateway peering**
* Add **centralized logging VPC**

---

# 📚 Learning Outcomes

This project demonstrates practical implementation of:

* AWS VPC Networking
* Transit Gateway Architecture
* Terraform Infrastructure as Code
* Multi-VPC Routing
* Cloud Network Design Patterns

---

# 👨‍💻 Author

**Karthik Raju**

AWS DevOps Engineer | Cloud Infrastructure | Terraform | Kubernetes

GitHub
https://github.com/KarthikKunchala23

LinkedIn
https://linkedin.com

---

# ⭐ Support

If you found this project useful:

⭐ Star the repository
🍴 Fork it
🛠 Contribute improvements

---

# 📜 License

This project is licensed under the **MIT License**.
