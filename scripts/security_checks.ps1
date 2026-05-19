# =========================
# SECURITY CHECKS
# =========================

# Inactive users (30 days)
Search-ADAccount -AccountInactive -TimeSpan 30.00:00:00

# Password never expires
Get-ADUser -Filter {PasswordNeverExpires -eq $true}

# Password policy
Get-ADDefaultDomainPasswordPolicy