$guid = "{86CA1AA0-34AA-4E8B-A509-50C905BAE2A2}" 
New-Item -Path "HKCU:\Software\Classes\CLSID\" -Name $guid
New-Item -Path "HKCU:\Software\Classes\CLSID\$guid" -Name InprocServer32 -Value "" 