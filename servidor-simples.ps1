# Servidor HTTP simples - versão localhost
$port = 3000
$rootPath = Get-Location

Write-Host "========================================" -ForegroundColor Green
Write-Host "Servidor HTTP Local" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host "Porta: $port" -ForegroundColor Yellow
Write-Host "Diretório: $rootPath" -ForegroundColor Yellow
Write-Host ""
Write-Host "Acesse: http://localhost:$port" -ForegroundColor Cyan
Write-Host "Pressione Ctrl+C para parar" -ForegroundColor Gray
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# Criar o listener HTTP
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:${port}/")
$listener.Start()

Write-Host "Servidor iniciado! Aguardando requisições..." -ForegroundColor Green
Write-Host ""

try {
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response
        
        $localPath = $request.Url.LocalPath
        if ($localPath -eq "/") {
            $localPath = "/index.html"
        }
        
        $filePath = Join-Path $rootPath $localPath.TrimStart('/')
        $filePath = $filePath.Replace('/', '\')
        
        Write-Host "[$($request.HttpMethod)] $localPath" -ForegroundColor Gray
        
        if (Test-Path $filePath -PathType Leaf) {
            $content = [System.IO.File]::ReadAllBytes($filePath)
            $extension = [System.IO.Path]::GetExtension($filePath).ToLower()
            
            $contentType = "text/html"
            switch ($extension) {
                ".html" { $contentType = "text/html; charset=utf-8" }
                ".css"  { $contentType = "text/css; charset=utf-8" }
                ".js"   { $contentType = "application/javascript; charset=utf-8" }
                ".json" { $contentType = "application/json; charset=utf-8" }
                ".jpg"  { $contentType = "image/jpeg" }
                ".jpeg" { $contentType = "image/jpeg" }
                ".png"  { $contentType = "image/png" }
                ".gif"  { $contentType = "image/gif" }
                ".svg"  { $contentType = "image/svg+xml" }
                ".ico"  { $contentType = "image/x-icon" }
            }
            
            $response.ContentType = $contentType
            $response.ContentLength64 = $content.Length
            $response.StatusCode = 200
            $response.OutputStream.Write($content, 0, $content.Length)
        } else {
            $notFound = [System.Text.Encoding]::UTF8.GetBytes("404 - Arquivo não encontrado: $localPath")
            $response.ContentType = "text/html; charset=utf-8"
            $response.ContentLength64 = $notFound.Length
            $response.StatusCode = 404
            $response.OutputStream.Write($notFound, 0, $notFound.Length)
        }
        
        $response.Close()
    }
} finally {
    $listener.Stop()
    Write-Host "`nServidor parado." -ForegroundColor Yellow
}
