@echo off
title THPTQG Master - Huong Dan Dua Len GitHub Pages
cd /d "%~dp0"

echo ==========================================================
echo    CHUAN BI DUA WEB LEN GITHUB PAGES (MIEN PHI 24/7)
echo ==========================================================
echo.
echo [*] Dang cap nhat lai ban build web moi nhat trong thu muc dist...
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\package_dist.ps1"

echo.
echo [*] Dang mo thu muc chua cac file web 'dist' tren may tinh cua ban...
powershell -Command "explorer.exe '%~dp0dist'"

echo [*] Dang mo trang tao Repository tren GitHub (github.com/new)...
start https://github.com/new

echo.
echo ==========================================================
echo  CAC BUOC THUC HIEN TREN TRINH DUYET (CHI MAT 1 PHUT):
echo ==========================================================
echo  1. Tren trang GitHub vua mo:
echo     - Dat ten Repository: thptqg-exam
echo     - Chon che do: Public (Bat buoc de dung Pages mien phi)
echo     - Nhan nut xanh: 'Create repository'
echo.
echo  2. O trang tiep theo, tim va nhan vao dong chu:
echo     'uploading an existing file'
echo.
echo  3. Keo TOAN BO cac file va thu muc trong cua so 'dist' vua mo
echo     (index.html, thu muc css, thu muc js...) tha vao o giua trang web.
echo     - Cuon xuong duoi nhan nut xanh: 'Commit changes'
echo.
echo  4. Bat tinh nang GitHub Pages:
echo     - Bam vao tab 'Settings' o tren cung cua repo
echo     - O cot ben trai, chon muc 'Pages'
echo     - Tai phan 'Branch', chon 'main' (hoac 'master') roi nhan 'Save'
echo.
echo  5. XONG! Sau 1-2 phut, link web se la:
echo     https://<ten-user-github>.github.io/thptqg-exam/
echo ==========================================================
echo.
pause
