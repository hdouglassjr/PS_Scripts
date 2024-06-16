Add-Type -AssemblyName PresentationFramework
# Function to filter data based on search term
function Search-Data {
    [CmdletBinding()]
    param (
        [string]
        $searchTerm
    )
    $filteredData = $data | Where-Object {
        $_.Name -like "*$searchTerm*" -or
        $_.Age -like "*$searchTerm*" -or
        $_.City -like "*$searchTerm*"
    }
    return $filteredData
}
# Sample data for grid
$data = @(
    [PSCustomObject]@{Name = "John"; Age = 25; City = "New York" },
    [PSCustomObject]@{Name = "Jane"; Age = 30; City = "Los Angeles" },
    [PSCustomObject]@{Name = "Jim"; Age = 35; City = "Chicago" },
    [PSCustomObject]@{Name = "Jill"; Age = 40; City = "Houston" }
)

[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        Title="Search GUI" Height="350" Width="525">
    <Grid ShowGridLines="True">
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="*"/>
            <ColumnDefinition Width="Auto"/>
        </Grid.ColumnDefinitions>
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
        </Grid.RowDefinitions>
        <TextBox Name="SearchBox" Grid.Row="0" Grid.Column="0" Margin="10"/>
        <Button Name="SearchButton" Grid.Row="0" Grid.Column="1" Margin="10" Content="Search"/>
        <DataGrid Name="ResultsGrid" Grid.Row="1" Grid.ColumnSpan="2" Margin="10"/>
    </Grid>       
   
</Window>
"@
# Load the XAML
$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load( $reader )

# Find the controls
$SearchBox = $window.FindName("SearchBox")
$SearchButton = $window.FindName("SearchButton")
$ResultsGrid = $window.FindName("ResultsGrid")


# Event handler for Search button
$SearchButton.Add_Click({
        $searchTerm = $SearchBox.Text
        $filterdData = Search-Data -searchTerm $searchTerm
        $ResultsGrid.ItemsSource = @($filterdData)
    })

$ResultsGrid.ItemsSource = $data

# Show the window
$window.ShowDialog() | Out-Null
