$httpServer = [System.Net.HttpListener]::new()
$httpServer.Prefixes.Add("http://localhost:3000/")
$httpServer.Start()

while ($httpServer.IsListening) {
    $context = $httpServer.GetContext()
    if ($context.Request.HttpMethod -eq ’GET’ -and $context.Request.RawUrl 
      -eq ’/dapr/subscribe’) {   
        $buffer = [System.Text.Encoding]::UTF8.GetBytes("[{topic: ’A’, 
          route: ’/A’]")
        $context.Response.ContentLength64 = $buffer.Length
        $context.Response.ContentType = "application/json"
        $context.Response.OutputStream.Write($buffer, 0, $buffer.Length)
        $context.Response.OutputStream.Close() 
    }
    if ($context.Request.HttpMethod -eq ’POST’ -and $context.Request.RawUrl 
      -eq ’/A’) {    
        $length = $context.Request.ContentLength64
        $buffer = [System.Byte[]]::CreateInstance([System.Byte],$length)
        $context.Request.InputStream.Read($buffer,0,$length)
        $message = [System.Text.Encoding]::UTF8.GetString($buffer)
        write-host $message
        $buffer = [System.Text.Encoding]::UTF8.GetBytes("OK")
        $context.Response.ContentLength64 = $buffer.Length
        $context.Response.OutputStream.Write($buffer, 0, $buffer.Length)
        $context.Response.OutputStream.Close() 
    }
}
