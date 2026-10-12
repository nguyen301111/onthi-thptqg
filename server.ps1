# Máy chủ Web HTTP mini nội bộ viết bằng PowerShell (.NET HttpListener)
# Chạy độc lập trên mọi máy Windows, không cần cài đặt Node.js hay Python!

$port = 8080
$rootPath = $PSScriptRoot
if (-not $rootPath) { $rootPath = (Get-Location).Path }

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")

try {
    $listener.Start()
    Write-Host "==========================================================" -ForegroundColor Green
    Write-Host "  THPTQG Master 2025 Web Server đang hoạt động!" -ForegroundColor Cyan
    Write-Host "  Truy cập: http://localhost:$port/" -ForegroundColor Yellow
    Write-Host "  Thư mục: $rootPath" -ForegroundColor Gray
    Write-Host "  Nhấn Ctrl+C trong cửa sổ này để dừng máy chủ" -ForegroundColor Gray
    Write-Host "==========================================================" -ForegroundColor Green

    # Tự động mở trình duyệt mặc định
    Start-Process "http://localhost:$port/"

    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        $urlPath = $request.Url.LocalPath.TrimStart('/')
        if ([string]::IsNullOrEmpty($urlPath)) { $urlPath = "index.html" }

        $filePath = Join-Path $rootPath $urlPath.Replace('/', [System.IO.Path]::DirectorySeparatorChar)

        if (Test-Path $filePath -PathType Leaf) {
            $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
            $contentType = switch ($ext) {
                ".html" { "text/html; charset=utf-8" }
                ".css"  { "text/css; charset=utf-8" }
                ".js"   { "application/javascript; charset=utf-8" }
                ".json" { "application/json; charset=utf-8" }
                ".png"  { "image/png" }
                ".jpg"  { "image/jpeg" }
                ".svg"  { "image/svg+xml" }
                default { "application/octet-stream" }
            }

            $bytes = [System.IO.File]::ReadAllBytes($filePath)
            $response.ContentType = $contentType
            $response.ContentLength64 = $bytes.Length
            $response.OutputStream.Write($bytes, 0, $bytes.Length)
        } else {
            $response.StatusCode = 404
            $errBytes = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found")
            $response.OutputStream.Write($errBytes, 0, $errBytes.Length)
        }

        $response.Close()
    }
}
catch {
    Write-Host "Lỗi khởi động máy chủ: $_" -ForegroundColor Red
}
finally {
    $listener.Stop()
}
