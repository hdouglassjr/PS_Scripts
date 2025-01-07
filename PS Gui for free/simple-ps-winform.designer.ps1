$Form1 = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Label]$Label1 = $null
function InitializeComponent
{
$Label1 = (New-Object -TypeName System.Windows.Forms.Label)
$Form1.SuspendLayout()
#
#Label1
#
$Label1.BackColor = [System.Drawing.SystemColors]::ActiveCaptionText
$Label1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]31,[System.Int32]48))
$Label1.Name = [System.String]'Label1'
$Label1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]100,[System.Int32]23))
$Label1.TabIndex = [System.Int32]0
$Label1.Text = [System.String]'Hello World!'
#
#Form1
#
$Form1.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]339,[System.Int32]267))
$Form1.Controls.Add($Label1)
$Form1.Text = [System.String]'Form1'
$Form1.add_Load($Form1_Load)
$Form1.ResumeLayout($false)
Add-Member -InputObject $Form1 -Name Label1 -Value $Label1 -MemberType NoteProperty
}
. InitializeComponent
