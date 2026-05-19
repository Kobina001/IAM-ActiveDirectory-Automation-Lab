# 🧠 IAM Active Directory Automation & Security Lab

## 📌 Overview
This project simulates a real-world Identity and Access Management (IAM) environment using Windows Server Active Directory and PowerShell automation.

It demonstrates enterprise identity lifecycle management, RBAC implementation, and security auditing.

---

## 🏗️ Architecture

- Windows Server 2022 (Domain Controller)
- Windows 10 Client Machine
- Active Directory Domain Services (AD DS)
- DNS integrated with AD
- Organizational Units (IT, HR, Finance, Security)
- Security Groups (RBAC model)

---

## ⚙️ Features

### ✔ Identity Provisioning
- Bulk user creation from CSV
- Automated OU assignment
- Password provisioning

### ✔ RBAC (Role-Based Access Control)
- Department-based security groups
- IT_Users, HR_Users, Finance_Users, Security_Users

### ✔ IAM Automation
- PowerShell scripting
- CSV-driven onboarding
- Error handling (try/catch)
- Logging system

### ✔ IAM Security & Auditing
- Inactive user detection
- Privileged account auditing
- Full directory export reports
- Security compliance reporting

---

## 🧾 Key Scripts

- bulk_user_provisioning.ps1 → Automated onboarding
- iam_audit_reports.ps1 → Security reports
- security_checks.ps1 → IAM validation scripts

---

## 📊 Reports Generated

- Full AD User Inventory
- Domain Admins Report
- Security Audit Report
- Inactive Accounts Report

---

## 🔐 Security Concepts Demonstrated

- Identity Lifecycle Management
- Role-Based Access Control (RBAC)
- Least Privilege Principle
- Privileged Access Management (PAM)
- Active Directory Security Monitoring

---

## ⚠️ Issues Solved

- CSV formatting issues
- PowerShell variable errors ($users)
- New-ADUser parameter breakdown
- VM clipboard limitations
- Domain naming inconsistencies

---

## 🚀 How to Run

1. Clone repo
2. Open PowerShell as Administrator
3. Ensure Active Directory module is installed
4. Run scripts in order:

```powershell
.\scripts\01_bulk_user_provisioning.ps1
.\scripts\02_iam_audit_reports.ps1
.\scripts\03_security_checks.ps1

---

## 🚀 Outcome

This project demonstrates enterprise-level IAM engineering skills using Active Directory and PowerShell automation.