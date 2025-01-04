using namespace System.Net
[ServicePointManager]::SecurityProtocol = [ServicePointManager]::SecurityProtocol -bor [SecurityProtocolType]::Tls12 -bor [SecurityProtocolType]::Tls13