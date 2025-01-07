Add-Type -AssemblyName PresentationFramework

# Create the WPF window
$window = New-Object Windows.Window
$window.Title = "Winget Help"
$window.SizeToContent = "WidthAndHeight"

# Create a TextBox to display the output
$textBlock = New-Object Windows.Controls.TextBlock

# Run the winget command and capture the output
$output = winget --help

# Set the TextBox content
$textBlock.Text = $output | Out-String -Width 4096
$textBlock.Background = 'AntiqueWhite'
$textBlock.Padding = '15'

# Now let's create a ScrollViewer control to add the textblock to so we can scroll.
$scrollViewer = New-Object System.Windows.Controls.ScrollViewer
$scrollViewer.CanContentScroll = 'True'
$scrollViewer.Content = $textBlock
# Show the window
$window.ShowDialog()