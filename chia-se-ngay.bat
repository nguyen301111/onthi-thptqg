@echo off
title THPTQG Master - Chia Se Web Truc Tiep Tu May Tinh
cd /d "%~dp0"

echo ==========================================================
echo    CHIA SE WEB TRUC TIEP TU MAY TINH QUA INTERNET
echo ==========================================================
echo.
echo [*] Dang kiem tra may chu web noi bo (Port 8080)...
netstat -ano | findstr /R /C:":8080 .*LISTENING" >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [*] May chu chua chay, dang khoi dong server noi bo...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File \"\"%~dp0server.ps1\"\"' -WindowStyle Hidden"
    ping 127.0.0.1 -n 3 >nul
)

echo.
echo [*] Dang tao duong ham cong khai HTTPS qua Pinggy SSH...
echo ----------------------------------------------------------
echo CHU Y: Sau khi ket noi thanh cong, man hinh se hien thi:
echo      Http URL: https://xxxxxxxx.pinggy.link
echo Ban chi can copy duong link do gui cho ban be la vao duoc!
echo (Khong tat cua so nay trong suot qua trinh chia se)
echo ----------------------------------------------------------
echo.

ssh -o StrictHostKeyChecking=no -p 443 -R0:localhost:8080 a.pinggy.io

pause
