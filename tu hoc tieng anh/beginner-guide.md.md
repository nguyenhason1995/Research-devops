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
* Trong trường hợp không hoạt động như kỳ vọng, bạn có thể tìm log trong error.log và access.log trong đường dẫn `/usr/local/nginx/logs` hay `/var/log/nginx`.

# Thiết lập một Proxy Serve đơn giản
* Một trong những thiết lập hay sử dụng trong nginx như là một proxy serve, có nghĩa là một server nhận request, và chuyển chúng đến server đã đc proxy, lọc response từ chúng, và gửi đến client. 

* Chúng ta sẽ cấu hình 1 server proxy cơ bản, phục vụ các yêu cầu về hình ảnh với các tệp file từ đường dẫn local và gửi tất cả những request để là 1 proxy server. Trong ví dụ này, cả 2 máy chủ được định nghĩa trên 1 nginx 

* Đầu tiên, định nghĩa proxy server là add thêm server block trong file nginx config với các nội dung dưới đây:
```php
server {
    listen 8080;
    root /data/up1;

    location / {
    }
}
```
Đó sẽ là một server đơn giản lắng nghe ở port 8080(trước đó, listen directive không được chỉ rõ từ khi port 80 đc sử dụng) và map tới tất cả các request đến `/data/up1` trên local. Tạo thư mục và để  file index.html và nó. Lưu ý rằng `root` directive được đặt trong `server` context. `root` directive được sử dụng khi `location` block đã lựa chọn để phục vụ 1 request không bao gồm `root` directive

* Tiếp theo đó, sử dụng cấu hình server từ section trước đó và sửa nó để tạo 1 cấu hình proxy server. Trong `location` block đầu tiên, đặt directive `proxy_pass` directive với protocol, name và port của proxy_server được chỉ rõ trong parameter (trong trường hợp này, nó là http://localhost:8080)

```php
server {
    location / {
        proxy_pass http://localhost:8080;
    }

    location /images/ {
        root /data;
    }
}
```
* Chúng ta sẽ sửa `location` block thứ 2, cái hiện tại map request với `/images/` đến đường dẫn dưới `/data/images`, để làm cho nó phù hợp với yêu cầu của `images` với phần mở rộng. Khối này sau khi sửa sẽ ntn:
```php
location ~ \.(gif|jpg|png)$ {
    root /data/images;
}
```
* prameter khớp với URI kết thúc bằng .gif, .jpg hoặc .png. Một biểu thức hợp quy nên đặt trước ~. Các yêu cầu tương ứng sẽ ánh xạ dến `/data/images`

* Khi nginx lựa chọn một `location` block đến 1 serve request đầu tiên nó sẽ kiểm tra `location` directive, nhớ rằng `location` với prefix dài nhất, và sau đó check regular expression. Nếu match với regular expression, nginx chọn `location` hay nếu không , nó sẽ chọn 1 cái nhớ trước đó. 

* Kết quả là file cấu hình sẽ trông ntn:
```php
server {
    location / {
        proxy_pass http://localhost:8080/;
    }

    location ~ \.(gif|jpg|png)$ {
        root /data/images;
    }
}
```
Server đó sẽ lọc request kết thúc với .gif, .jpg, or .png và map chúng đến `data/images` và pass tất cả các request đến đến server phía trên.

# Cài đặt FastCGI Proxying

* Nginx có thể được sử dụng để route request đến FastCGI server, nó chạy application với biến framework và ngôn ngữ lập trình như PHP.

* Cấu hình nginx cơ bản để làm với FastCGI server bao gồm sử dụng  directive `fastcgi-pass` thay vì directive `proxy-pass`, và directive `fastcgi_param` để set parameter chuyển tới 1 server FastCGI. Giả sử server FastCGI truy cập `locahost:9000`. Nói về cấu hình proxy từ section trước 1 cách đơn giản. Thay thế directive `proxy-pass` với directive `fastcgi_pass` và thay parameter đến `locahost:9000`. Trong PHP, parameter SCRIPT_FILENAME được sử dụng để xác định script name, và parameter `QUERY_STRING` được sử dụng để chuyền parameter request. kết quả cấu hình mong muốn là:
```php
server {
    location / {
        fastcgi_pass  localhost:9000;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param QUERY_STRING    $query_string;
    }

    location ~ \.(gif|jpg|png)$ {
        root /data/images;
    }
}
```
Đó sẽ là setup 1 server nó sẽ route tất cả request ngoại trừ request từ static image đến hệ thống proxy server trên `localhost:9000` thông qua giao thức FastCGI
 









