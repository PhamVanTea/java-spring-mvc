Java Spring MVC Application
Đây là một dự án ứng dụng web được xây dựng bằng Java và Spring MVC, sử dụng JSP để làm giao diện. Dự án này được thiết kế theo mô hình MVC (Model-View-Controller), giúp tổ chức mã nguồn rõ ràng và dễ mở rộng.

🛠️ Công nghệ sử dụng
FrontEnd: HTML/CSS, JavaScript, Bootstrap, jQuery, JSTL,
BackEnd: Spring MVC, Spring Data JPA, Spring Security, Hibernate, Maven 
SQL: MySQL 
    
🌟 Các tính năng chính
Quản lý sản phẩm:
Hiển thị danh sách sản phẩm.
Xem chi tiết sản phẩm.
Thêm, sửa, xóa sản phẩm (dành cho Admin).
Quản lý người dùng:
Đăng nhập, đăng ký.
Phân quyền (Admin/User).
Tìm kiếm sản phẩm:
Cho phép người dùng tìm kiếm sản phẩm theo tên hoặc danh mục.

🚀 Cách chạy dự án
1. Clone dự án từ GitHub
git clone https://github.com/PhamVanTea/java-spring-mvc.git
cd java-spring-mvc
2. Cấu hình cơ sở dữ liệu
Mở file src/main/resources/application.properties.
Cập nhật thông tin kết nối cơ sở dữ liệu:
spring.datasource.url=jdbc:mysql://localhost:3306/ten_database
spring.datasource.username=ten_tai_khoan
spring.datasource.password=mat_khau
spring.jpa.hibernate.ddl-auto=update

4. Build và chạy dự án
Sử dụng Maven để build dự án:
mvn clean install
Chạy ứng dụng:
mvn spring-boot:run

6. Truy cập ứng dụng
Mở trình duyệt và truy cập: http://localhost:8080.

🛡️ Bảo mật
Sử dụng Spring Security để bảo vệ các endpoint.
Phân quyền cho Admin và User.

📌 Ghi chú
Đảm bảo cài đặt Java 8 trở lên.
Cài đặt MySQL hoặc cơ sở dữ liệu tương tự để chạy dự án.
