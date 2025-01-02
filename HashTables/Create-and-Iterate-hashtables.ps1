$myHashtable = @{
    "key1" = "value1"
    "key2" = "value2"
    "key3" = "value3"
}

foreach ($pair in $myHashtable.GetEnumerator()) {
    Write-Host "Key: $($pair.Key), Value: $($pair.Value)"
}

$hashtable = @"
{
    "Decimal": 1.23,
    "String": "string",
    "Int32": 1,
    "Int64": 2147483648,
    "Boolean": true
}
"@ | ConvertFrom-Json -AsHashtable
$hashtable.GetEnumerator() | ForEach-Object {
    Write-Host "Key: $($_.Key), Value: $($_.Value)"
}