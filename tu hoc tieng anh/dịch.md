# **Hướng dẫn cho người bắt đầu**
* Hướng dẫn này đưa ra 1 giới thiệu cơ bản của Nginx và mô tả vài task đơn giản mà có thể hoàn thành với nginx. Hướng dẫn này đã hỗ trợ cài đặt nginx trên máy của độc giả.Nếu bản hướng dẫn này không hữu dụng, hãy xem trang cài đặt nginx. Hướng dẫn mô tả start và stop nginx, reload cấu hình của nginx, giải thích cấu trúc của file cấu hình và mô tả làm cách nào để thiết lập nginx đến server nội dung tĩnh. Làm cách nào để cấu hình nginx x như 1 proxy server, và làm thế nào để kết nối với ứng dụng FastCGI.

* Nginx có 1 process master và vài process worker. Mục đích chính của master process là để đọc và đánh gia câu hình, và duy trì worker process. Worker process xử lý các request. nginx sử dụng event dựa trên mô hình và OS phụ thuộc vào cơ chế phân phối hiệu quả giữa các worker process. Số lượng các worker process được định nghĩa trong file cấu hình và được fix bới một cấu hình nhất định hay tự động hóa đã đc điều chỉnh đến số lượng CPU core có sẵn 

* Cách nginx và mô hình hoạt động của nó đã được xác định trong file cấu hình. Mặc định, file cấu hình được đặt tên là nginx. conf và đặt trong đường dẫn `/usr/local/nginx/conf` , `/etc/nginx` hay ` /usr/local/etc/nginx`

* Starting, Stopping, and Reloading Configuration
Để start nginx, chạy file được thưc thi. Để start nginx, chạy file thực thi, nó có thể đã được kiểm soát với parameter -s. Theo như cấu trúc
nginx -s signal
Nơi signal có thể là một trong theo những điều sau:
stop — fast shutdown
quit — graceful shutdown
reload — reloading the configuration file
reopen — reopening the log files

* cho vi du, de stop nginx pocess voi cho worker process ket thuc serving current request, co the thuc hien cac command sau:
```markdown
nginx -s quit 
```
command này nên được thực thi dưới cùng một user mà nó được start bởi Nginx

* Sự thay đổi đã làm nên file cấu hình không được apply cho đến khi command reload lại cấu hình đã được gửi đến nginx hoặc nó được khởi động lại. Để reload lại cấu hình, sử dụng câu lệnh:
```markdown
nginx -s reload
```
* Một khi master process nhận tín hiệu từ reload lại cấu hình, nó kiểm tra cấu trúc hiệu lực của file cấu hình mới và thử apply cấu hình đã cung cấp trong nó. Nếu thành công, master process start worker process mới và gửi thông điệp tới process cũ, phản hồi chúng để shutdown. Nếu không thì master process rollback cấu hình thay đổi trước đó và tiếp tục sử dụng cấu hình cũ. Worker process cũ, nhận 1 command để shutdown, stop accept kết nối mới và tiếp tục để service hiện tại request cho đến khi tất cả các service được sử dụng. Sau đó, worker process mới thoát.

* Một signal có lẽ cũng đc gửi đến nginx process với sự giúp đỡ của Unix tools như là công cụ "kill".Trong thực tế, một signal gửi trực tiếp đến process sẽ trả ra 1 process ID . Process ID của master process đã đc viết mặc định đến nginx.pid trong đường dẫn `/usr/local/nginx/logs` hay `/var/run`. Cho ví dụ, nếu master process ID là 1628, để gửi kết quả QUIT signal:
```php
kill -s QUIT 1628
```

Để lấy list nginx process đang chạy, cộng cụ `ps` được sử dụng :
```php
ps -ef |grep nginx
```
Để tìm hiểu thêm thông tin được gửi signal đến nginx, xem [tham khảo](https://nginx.org/en/docs/control.html)
# Cấu trúc file cấu hình 

* nginx bao gồm các module cái được điều khiển bởi  chỉ định directive trong file cấu hình. Directive được chia thành các chỉ thị và khối directive. 1 chỉ thị directive đơn giản bao gồm tên và parameter được ngăn cách bởi khoảng chống và kết thúc bởi ; Một block directive có chung cấu trúc như là một directive đơn giản, nhưng thay vì kết thúc bởi dấu chấm phẩy `;` thì nó kết thúc bằng `{} `. Nếu các block directive chứa nhiều chỉ thị directive thì được gọi là context
ví dụ `event`, `http`, `server`, `location`.

* những directive trong file cấu hình bên ngoài context có thể cân nhắc trở thành bên trong main context. `events` và `http` directive cư trú trong main context, `server` trong `http` và `location` trong `server`

* Phần còn lại sau `#' là comment.

# Nội dung web tĩnh

* Một task web server quan trọng được phục vụ bên ngoài file(giống như ảnh hoặc page html tĩnh). Bạn sẽ thực hiện một ví dụ tại nơi đang phụ thuộc và request, file sẽ được lưu từ đường dẫn khác: `/data/www` (bao gồm file HTML) và `/data/images` (bao gồm file ảnh). Đường dẫn thư mục đó sẽ yêu cầu edit trong file cấu hình và cài đặt của `server` block bên trong `http` block bới hai `location` block.

* Đầu tiên, tạo  đường dẫn `/data/www` và đặt trong `index.html` với những nội dung chứa bên trong nó và tạo thư mục `data/images` và để vài ảnh bên trong đường dẫn.

* Tiếp theo, open file config. Cấu hình mặc định đã được bao gồm vài ví dụ về server block:
```php
http {
    server {
    }
}
```

- Thông thường, file cấu hình bao gồm vài server block được phân biệt bởi port trên server name. Một khi nginx quyết định cái server xử lý  yêu cầu, nó kiểm tra URI trong request header trong chỉ thị location trong  `server` block 
```php
location / {
    root /data/www;
}
```
- location block được chỉ rõ `/` so với URI bên trong request. Để matching request, URI sẽ thêm đường dẫn cụ thể trong root directive, đó là đường đẫn `/data/www`. Nếu có một số khối vị trí phù hợp, nginx sẽ chọn khối có tiền tố dài nhất. Khối vị trí ở trên cung cấp tiền tố ngắn nhất, có độ dài là một và vì vậy chỉ khi tất cả các `location` block khác không cung cấp kết quả khớp, thì block này mới được sử dụng
```php
server {
    location / {
        root /data/www;
    }

    location /images/ {
        root /data;
    }
}
```

* Cấu hình đã được hoạt động trên 1 server đã được lắng nghe trên cổng 80 và có thể được truy cập trên máy local tại ` http:// localhost/`. Trong phản hồi đến request với URIs bắt đầu với `/images/`, server sẽ gửi file đến đường dẫn `/data/images`. Cho ví dụ, trong phản hồi đến `http://localhost/images/example.png` request nginx sẽ gửi file `/data/images/example.png`. Nếu file đó không tồn tại, nginx sẽ gửi  response chỉ ra lỗi 404. Request với URI không bắt đầu với `/images/` sẽ được map trong thư mục `/data/www`. Ví dụ, trong phản hồi đến `http://localhost/some/example.html` request nginx sẽ gửi file thư mục `/data/www/some/example.html`

* Để apply file cấu hình mới, start nginx nếu nó không được start :
```php
nginx -s reload
```
* Trong trường hợp không hoạt động như kỳ vọng, bạn có thể tìm log trong error.log và access.log trong đường dẫn `/usr/local/nginx/logs hay /var/log/nginx.









