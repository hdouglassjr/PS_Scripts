$Form1_Load = {
}
Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'simple-ps-winform.designer.ps1')
$Form1.ShowDialog()