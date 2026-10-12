# Script khởi động thông minh cho THPTQG Master 2025
$port = 8080
$url = "http://localhost:$port/"
$scriptDir = $PSScriptRoot
if (-not $scriptDir) { $scriptDir = (Get-Location).Path }

# Kiểm tra xem máy chủ đã chạy chưa
$isAlreadyRunning = $false
try {
    $tcp = Get-NetTCPConnection -LocalPort $port -State Listen -ErrorAction SilentlyContinue
    if ($tcp) { $isAlreadyRunning = $true }
} catch {
    $isAlreadyRunning = $false
}

if (-not $isAlreadyRunning) {
    # Khởi động máy chủ dưới dạng tiến trình ngầm không hiện cửa sổ
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File `"$scriptDir\server.ps1`"" -WindowStyle Hidden
    Start-Sleep -Milliseconds 800
}

# Mở trình duyệt đến trang web
Start-Process $url
