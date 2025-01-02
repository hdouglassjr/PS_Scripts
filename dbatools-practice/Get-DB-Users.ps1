# Get users
$users = Get-DbaDbUser -SqlInstance ESPEED4\SQLEXPRESS -Database AdventureWorks

# Get permissions
$permissions = Get-DbaPermission -SqlInstance ESPEED4\SQLEXPRESS -Database AdventureWorks

# Combine results
$users | ForEach-Object {
    $username = $_.Name
    $userPerms = $permissions | Where-Object { $_.Grantee -eq $username }
    [PSCustomObject]@{
        UserName      = $username
        DefaultSchema = $_.DefaultSchema
        Permissions   = $userPerms | Select-Object PermissionType, Securable
    }
}

