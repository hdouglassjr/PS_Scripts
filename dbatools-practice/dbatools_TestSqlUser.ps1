$testSqlUser = Get-Credential -UserName 'testSqlUser' -Message 'Enter the SQL Server login credentials for the testSqlUser account.'

$sql = Connect-DbaInstance -SqlInstance ESPEED4\SQLEXPRESS -Database AdventureWorks
Get-DbaUserPermission -SqlInstance $sql -SqlCredential $testSqlUser -Database AdventureWorks | Where-Object { $_.Member -eq "ESPEED4\TestSqlUser1" } |  ft -AutoSize
