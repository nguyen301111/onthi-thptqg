# THPTQG Master 2025 - Kho Tài Liệu & Luyện Thi Chuẩn BGD 2025

Hệ thống ứng dụng Web tổng hợp tài liệu ôn thi THPT Quốc Gia (Toán - Vật Lí - Hóa Học) và công cụ tự động sinh đề thi thử đổi số liệu chuẩn theo format chính thức của **Bộ Giáo Dục & Đào Tạo từ năm 2025**.

---

## 🌟 Tính Năng Nổi Bật

### 1. 📚 Kho Tài Liệu Trực Tuyến Toàn Diện
- Phân loại rõ ràng theo **Môn học** (Toán, Vật Lí, Hóa Học), **Thể loại** (Đề thi thử, Đề minh họa Bộ GD&ĐT, Chuyên đề lý thuyết & bài tập).
- Cập nhật các nội dung mới nhất của **Chương trình GDPT 2018**:
  - **Toán:** Khảo sát hàm số, Hình học Oxyz, Xác suất có điều kiện & Công thức Bayes.
  - **Vật Lí:** Vật lí nhiệt, Khí lý tưởng, Từ trường, Vật lí hạt nhân.
  - **Hóa Học:** Ester - Lipid, Carbohydrate, Kim loại chuyển tiếp & Phức chất.
- Tích hợp tìm kiếm theo từ khóa, liên kết tải về hoặc mở xem trực tuyến, cho phép thí sinh tự bổ sung tài liệu của riêng mình.

### 2. 🎲 Công Nghệ Sinh Đề Đổi Số Liệu (Parametric Randomizer)
- Dựa trên ngân hàng câu hỏi gốc bám sát chuẩn kiến thức, hệ thống tự động:
  - Thay đổi ngẫu nhiên các hệ số, số liệu đầu vào (tọa độ, hàm số, nhiệt độ, áp suất, thể tích, khối lượng, nồng độ mol...).
  - Tự động tính toán lại đáp án chuẩn và sinh lời giải chi tiết từng bước.
  - Đảm bảo người học luyện tập cùng một dạng bài toán nhưng không bao giờ bị trùng lặp số liệu cũ.

### 3. ⏱️ Phòng Thi Thử Chuẩn Format Bộ GD&ĐT từ 2025
Áp dụng đúng 100% cấu trúc 3 phần mới của Bộ Giáo dục & Đào tạo:
- **Phần I: Câu trắc nghiệm nhiều phương án lựa chọn (A, B, C, D)**
  - Toán: 12 câu (3.0 điểm - mỗi câu 0.25đ).
  - Lí / Hóa: 18 câu (4.5 điểm - mỗi câu 0.25đ).
- **Phần II: Câu trắc nghiệm Đúng / Sai**
  - Gồm 4 câu hỏi lớn, mỗi câu có 4 ý a), b), c), d) (4.0 điểm).
  - Thang điểm lũy tiến chuẩn 2025: Đúng 1 ý: 0.1đ; đúng 2 ý: 0.25đ; đúng 3 ý: 0.5đ; đúng cả 4 ý: 1.0đ.
- **Phần III: Câu trắc nghiệm trả lời ngắn (Điền số)**
  - Gồm 6 câu hỏi yêu cầu thí sinh tự tính toán và nhập đáp số vào ô.
  - Toán: Mỗi câu 0.5đ (3.0 điểm).
  - Lí / Hóa: Mỗi câu 0.25đ (1.5 điểm).

### 4. 🧮 Hiển Thị Công Thức Khoa Học Chuẩn KaTeX
- Tích hợp công cụ KaTeX hiển thị mượt mà mọi công thức Toán học, phương trình phản ứng hóa học, ký hiệu góc, vectơ, tích phân, ma trận.

### 5. 📊 Bảng Điểm & Hướng Dẫn Giải Chi Tiết
- Tự động chấm điểm ngay sau khi nộp bài.
- Báo cáo phân tích điểm số từng phần kèm theo lời giải chi tiết từng bước cho tất cả các câu hỏi.
- Lưu lại lịch sử điểm số trên trình duyệt.

---

## 🚀 Hướng Dẫn Khởi Chạy

Ứng dụng được thiết kế độc lập, không yêu cầu cài đặt Node.js hay Python:

1. **Cách 1 (Nhanh nhất - Chạy máy chủ nội bộ):**
   - Click đúp vào file `start.bat` trong thư mục này.
   - Trình duyệt sẽ tự động mở trang web tại địa chỉ `http://localhost:8080/`.

2. **Cách 2 (Mở trực tiếp file HTML):**
   - Click đúp trực tiếp vào file `index.html` để mở ngay trên Google Chrome, Microsoft Edge hoặc Brave Browser.

---

## 🌐 Hướng Dẫn Đưa Web Lên Mạng Để Ai Cũng Truy Cập Được (24/7 Miễn Phí)

Website được xây dựng 100% bằng HTML5, CSS3, JavaScript độc lập (không cần backend/database), nên có thể đưa lên các nền tảng máy chủ miễn phí toàn cầu chỉ trong 30 giây:

### 🌟 Cách 1: Netlify Drop (Đơn giản nhất - Kéo thả có link ngay trong 10 giây)
1. Nhấp đúp vào file `mo-file-up-web.bat`. File này sẽ tự động nén web vào file `thptqg-exam-web.zip` và mở trang [Netlify Drop](https://app.netlify.com/drop).
2. Kéo file `thptqg-exam-web.zip` (hoặc thư mục `dist`) thả thẳng vào hình tròn trên trang web.
3. Sau 5 - 10 giây tải lên, bạn sẽ nhận được một đường link chính thức (ví dụ: `https://thptqg-master.netlify.app`), bất kỳ ai trên điện thoại hay máy tính đều truy cập được 24/7.

### 🌟 Cách 2: GitHub Pages (Lưu trữ vĩnh viễn, chuyên nghiệp)
1. Đăng nhập [GitHub](https://github.com/) -> Tạo Repository mới (chế độ **Public**).
2. Tải toàn bộ file trong thư mục `dist/` lên repository.
3. Vào **Settings** -> chọn **Pages** -> ở mục **Branch** chọn `main` rồi nhấn **Save**.
4. Sau 1 phút, web sẽ hoạt động tại địa chỉ: `https://<ten-user>.github.io/<ten-repo>/`.

### 🌟 Cách 3: Vercel Hosting (Tốc độ cao nhất)
1. Truy cập [Vercel](https://vercel.com/) -> Đăng nhập bằng tài khoản Google hoặc GitHub.
2. Kéo thả thư mục `dist/` hoặc liên kết với GitHub repository.
3. Nhận ngay đường link web siêu tốc: `https://thptqg-master.vercel.app`.

### ⚡ Cách 4: Mở link tức thời từ máy tính (Chia sẻ nhanh qua Internet)
- Nhấp đúp vào file `chia-se-ngay.bat`. Hệ thống sẽ khởi động máy chủ và tự động tạo một đường hầm an toàn HTTPS (Pinggy SSH) để ai cũng có thể vào xem web trực tiếp trên máy của bạn ngay lập tức.
