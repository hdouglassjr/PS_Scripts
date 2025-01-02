# Define the hashtable
$hashtable = @"
{
    "Key": "Value",
    "Nested": {
        "Key": "NestedValue"
    }
}
"@ | ConvertFrom-Json -AsHashtable

# Display the whole hashtable
$hashtable

# Display individual items
Write-Output "`nTop-level Keys:"
$hashtable.Keys | ForEach-Object { 
    Write-Output "$_ : $($hashtable[$_])" 
}

# Access the nested hashtable and display its keys
Write-Output "`nNested Keys:"
$hashtable['Nested'].Keys | ForEach-Object {
    Write-Output "$_ : $($hashtable['Nested'][$_])"
}

# Display nested hashtable recursively
$hashtable | Format-List -Force
