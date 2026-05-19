foreach ($user in $users) {

    try {

        # =========================
        # VALIDATION
        # =========================
        if (-not $user.Username -or -not $user.FirstName -or -not $user.LastName) {
            throw "Missing required fields for user"
        }

        # =========================
        # DUPLICATE CHECK
        # =========================
        $existingUser = Get-ADUser -Filter "SamAccountName -eq '$($user.Username)'" -ErrorAction SilentlyContinue

        if ($existingUser) {
            throw "User $($user.Username) already exists"
        }

        # =========================
        # PASSWORD
        # =========================
        $password = ConvertTo-SecureString $user.Password -AsPlainText -Force

        # =========================
        # OU PATH
        # =========================
        $ouPath = "OU=$($user.Department),DC=asap,DC=corp,DC=com"

        # =========================
        # USER PARAMETERS
        # =========================
        $params = @{
            Name              = "$($user.FirstName) $($user.LastName)"
            GivenName         = $user.FirstName
            Surname           = $user.LastName
            SamAccountName    = $user.Username
            UserPrincipalName = "$($user.Username)@asap.corp.com"
            AccountPassword   = $password
            Path              = $ouPath
            Enabled           = $true
        }

        # =========================
        # CREATE USER
        # =========================
        New-ADUser @params -ErrorAction Stop

        # =========================
        # RBAC GROUP ASSIGNMENT
        # =========================
        $groupName = "$($user.Department)_Users"

        Add-ADGroupMember -Identity $groupName -Members $user.Username -ErrorAction Stop

        # =========================
        # SUCCESS LOGGING
        # =========================
        Add-Content -Path "C:\IAM_Provisioning_Log.txt" -Value "SUCCESS: Created $($user.Username) in $($user.Department) at $(Get-Date)"

        Write-Host "SUCCESS: $($user.Username) created"

    }

    catch {

        # =========================
        # ERROR LOGGING
        # =========================
        Add-Content -Path "C:\IAM_Provisioning_Log.txt" -Value "ERROR: $($user.Username) - $($_) at $(Get-Date)"

        Write-Host "ERROR: $($user.Username) - $($_)"
    }
}