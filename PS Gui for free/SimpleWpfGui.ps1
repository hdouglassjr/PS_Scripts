# Before WPF can be used, the PresentationFoundation assembly must be loaded. 
# The assembly can be loaded using Add-Type. This command is required once in each PowerShell session that intends to use WPF
Add-Type -AssemblyName PresentationFramework

# The $Window variable contains the Window and all child elements it implements. 
# The Window can be explored and changed in PowerShell before it is displayed, or it can be displayed immediately.

$xaml = [xml]'<?xml version="1.0" encoding="utf-8"?>
<Window
 xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
 xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
 Width="350" Height="350">
    <Label Content="Hello world" />
</Window>'
$window = [System.Windows.Markup.XamlReader]::Load(
    [System.Xml.XmlNodeReader]$xaml
)

$window.ShowDialog()
