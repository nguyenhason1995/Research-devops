# làm việc với cmd:

`dir` list các thư mục bên trong

`cd` để vào bên trong thư mục

`cls` để xóa screen

`mkdir` tạo file

# install git:
- download git:
[git](https://git-scm.com/download/win)
# Một số các bước cài đặt cần chú ý:
![1](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_1.png) 

![2](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_2.png) 

![](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_3.png) 

- Còn lại tiếp tục next đến hết.

# Tạo tài khoản Github:

# Command git:
- git init: tạo trên máy local 1 repository

- git status: xem báo cáo status của git repository

- git clone: tạo một bản repository vào máy local

# Tạo 1 repository:
- mkdir my_first_repo

- cd my_first_repo

- git init

- Khi tạo 1 repository với `git init` sẽ xuất hiện 1 file ẩn .git

- file .git là file ẩn để quản lý phiên bản của file (versioning) bên trong git repository

# Tạo private repository:
- Đầu tiên tạo private repo trên trang chủ của github

![4](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_4.png) 

![5](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_5.png) 

![6](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_6.png) 

- Muốn clone vào máy local thì phải có token, gõ token trước xong @ hậu tố còn lại :

```php
git clone https://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@github.com/tuhocdevops/my-private-repo.git
```
