@echo off
title THPTQG Master - San Sang Dua Web Len Mang
cd /d "%~dp0"

echo ==========================================================
echo    CHUAN BI DUA WEB THPTQG MASTER 2025 LEN MANG (24/7)
echo ==========================================================
echo.
echo [*] Dang tao va cap nhat goi web sach thptqg-exam-web.zip...
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\package_dist.ps1"

echo.
echo [*] Dang mo thu muc chua file thptqg-exam-web.zip...
powershell -Command "explorer.exe /select,'%~dp0thptqg-exam-web.zip'"

echo [*] Dang mo trang web Netlify Drop (Hosting mien phi 24/7)...
start https://app.netlify.com/drop

echo.
echo ==========================================================
echo  HUONG DAN KEO THA (CHI MAT 10 GIAY):
echo  1. Tren trinh duyet vua mo ra trang Netlify Drop:
echo  2. Keo file 'thptqg-exam-web.zip' vua duoc chon trong cua so Folder
echo     roi THA thang vao hinh tron giua man hinh trang web.
echo  3. Doi khoang 5 - 10 giay de he thong tai len.
echo  4. Ban se nhan ngay 1 duong link web cong khai 24/7!
echo     (Vi du: https://thptqg-master-2025.netlify.app)
echo ==========================================================
echo.
pause
