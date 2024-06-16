
$sqlServiceName = 'MSSQL$SQLEXPRESS'
$serviceInfo = Get-Service -Name $sqlServiceName

if ($serviceInfo.Status -ne 'Running') {
    Write-Host 'SQL Service is not started, attempting to start...'
    Start-Service $sqlServiceName -Verbose
    $serviceInfo.Refresh()
    Write-Host $serviceInfo.Status
}
else {
    Write-Host "SQL service is in the $($serviceInfo.Status) state."
}