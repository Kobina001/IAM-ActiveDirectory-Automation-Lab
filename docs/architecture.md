# Architecture Diagram

## IAM Lab Structure

Windows 10 Client
        |
        | (Domain Authentication)
        v
Windows Server 2022 (Domain Controller)
- Active Directory Domain Services
- DNS Server

Organizational Units:
- IT
- HR
- Finance
- Security

Security Groups:
- IT_Users
- HR_Users
- Finance_Users
- Security_Users