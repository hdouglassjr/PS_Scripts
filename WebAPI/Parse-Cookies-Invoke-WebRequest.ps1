Invoke-WebRequest -UseBasicParsing -Uri "https://google.com" -WebSession $session


$cookies = Get-AllCookiesFromWebRequestSession $session


foreach ($cookie in $cookies) { 
    Write-Host "$($cookie.name) = $($cookie.value)"
}