# =========================
# IAM AUDIT REPORTING
# =========================

# Full user export
Get-ADUser -Filter * -Properties * |
Export-Csv "C:\FullADUsersReport.csv" -NoTypeInformation

# Security audit report
Get-ADUser -Filter * -Properties LastLogonDate,PasswordLastSet |
Select Name,SamAccountName,Enabled,LastLogonDate,PasswordLastSet |
Export-Csv "C:\SecurityAuditReport.csv" -NoTypeInformation

# Domain Admins
Get-ADGroupMember "Domain Admins" |
Select Name,SamAccountName |
Export-Csv "C:\DomainAdminsReport.csv" -NoTypeInformation