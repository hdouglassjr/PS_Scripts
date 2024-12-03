$userName = "ESPEED4\TestSqlUser1"
$password = ConvertTo-SecureString -String "abc123" -AsPlainText -Force

$credential = New-Object System.Management.Automation.PSCredential($userName, $password)

Start-Process -FilePath 'C:\Program Files (x86)\Microsoft SQL Server Management Studio 20\Common7\IDE\Ssms.exe' -Credential $credential -Debug