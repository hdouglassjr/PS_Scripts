$moduleName = 'posh-git'

if (-not(Get-Module -Name $moduleName)) {
    Write-Host "Module '$moduleName' is not installed.  Installing..."
    Install-Module -Name $moduleName -Force
}

Import-Module $moduleName