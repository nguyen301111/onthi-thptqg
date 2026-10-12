@echo off
title THPTQG Master 2025 - Khoi Dong He Thong
cd /d "%~dp0"

echo ==========================================================
echo   HE THONG ON THI THPT QUOC GIA VA LUYEN DE CHUAN BGD 2025
echo ==========================================================
echo.
echo [*] Dang kiem tra may chu web noi bo (Port 8080)...

netstat -ano | findstr /R /C:":8080 .*LISTENING" >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo [+] May chu web dang hoat dong san sang tren cong 8080.
) else (
    echo [*] Dang khoi dong may chu web ngam...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File \"\"%~dp0server.ps1\"\"' -WindowStyle Hidden"
    ping 127.0.0.1 -n 3 >nul
)

echo [*] Dang mo trinh duyet web: http://localhost:8080/
start http://localhost:8080/

echo.
echo ==========================================================
echo [THANH CONG] Toan bo tien trinh da duoc khoi dong xong!
echo Dia chi truy cap: http://localhost:8080/
echo ==========================================================
ping 127.0.0.1 -n 4 >nul
