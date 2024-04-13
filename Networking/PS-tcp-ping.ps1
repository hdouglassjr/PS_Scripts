$tcpClient = New-Object System.Net.Sockets.TcpClient
$tcpClient.Connect("DC2", 7)

$Text = "This is a test message!"
[byte[]]$bytes = [text.Encoding]::ASCII.GetBytes($Text)

$clientStream = $tcpClient.GetStream()

$clientStream.Write($bytes, 0, $bytes.Length)

$clientStream.DataAvailable
$tcpClient.Available
[byte[]]$inStream = New-Object byte[] 23
[Int]$response = $clientStream.Read($inStream, 0, $inStream.Count)
[System.Text.Encoding]::ASCII.GetString($inStream[0..($response - 1)])
$clientStream.Flush()

$clientStream.Dispose()
$tcpClient.Dispose()