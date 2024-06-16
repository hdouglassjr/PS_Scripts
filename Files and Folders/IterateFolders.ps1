
function Get-UserHomeFolderInfo {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$HomeRootPath
    )
    BEGIN {}
    PROCESS {
        Write-Verbose "Enumerating Home Root path..."
        $params = @{
            'Path'      = $HomeRootPath
            'Directory' = $true
        }
        ForEach ($folder in (Get-ChildItem $params)) {
            Write-Verbose "Checking $($folder.Name)"
            
        }
    }
    END {}
}