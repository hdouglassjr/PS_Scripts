Add-Type -AssemblyName System.Web

$queryString = [System.Web.HttpUtility]::ParseQueryString('')

$queryString.Add('q', 'Get-Content language:PowerShell repo:powershell/powershell')

$params = @{
    Uri = 'https://api.github.com/search/code?{0}' -f $queryString
}
