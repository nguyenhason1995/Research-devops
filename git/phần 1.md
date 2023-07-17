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

- git add: add cập nhật mới nhất trong repo

- git commit: xác nhận những thay đổi trong repo

- git push and git pull: push và pull code từ máy local lên github và ngược lại 

- git log: câu lệnh sẽ show 1 list các lệnh đã tạo đến 1 repository, bao gồm mã, message và metadata

- git remote -v: lệnh check remote branch. Nếu chạy từ 1 clone repo thì sẽ xem được URL của remote branch, 

nếu không connect đến remote branch thì sẽ không thể thấy URL

# Tạo private repository:
- Đầu tiên tạo private repo trên trang chủ của github

![4](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_4.png) 

![5](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_5.png) 

![6](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_6.png) 

- Muốn clone vào máy local thì phải có token, gõ token trước xong @ hậu tố còn lại :

```php
git clone https://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@github.com/tuhocdevops/my-private-repo.git
```
# Trường hợp muốn remote brand chính 

Đầu tiên check bằng `git remove -v` nếu không ra URL thì đây không phải trong branch. Muốn remote thì dùng 

các lệnh sau:

git remove add origin `link repository trên github`

git push -u orgin master

Sử dụng cách này có thể push code từ bất cứ máy local nào 

Sử dụng lệnh này để remove khỏi branch: `git remote remove origin`

`git remote add origin https://github.com/tuhocdevops/my.git`

`git push -u origin master`

# Git fetch, git pull

### **git fetch**

![7](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_7.png) 

- git fetch: tải xuống các commit mới nhất từ kho chứa trên github, điều này sẽ cho phép cập nhật thông tin 

về lịch sử commit và những thay đổi được thực hiện từ các thành viên trong dự án. Tuy nhiên sẽ không thể nhìn

thấy thay đổi trong file 

- Sử dụng fetch khi bạn muốn làm việc với những người khác và muốn nhìn thấy những thay đổi họ đã làm nhưng 

chưa ghi đè lên file của bạn.

- Cách sử dụng: có thể sử dụng lệnh `git fetch` hoặc có thể chỉ rõ branch bằng `git fetch <remote> <branch>` hoặc `git fetch origin <branch>` 

### **git pull**

- git pull: là khi muốn trực tiếp lấy các thay đổi từ remote branch và hợp nhất trực tiếp vào brach của mình.

- Nếu làm việc một mình với single branch, thì thường sẽ bỏ qua `git fetch` và `git merge` và sử dụng thằng 

`git pull`
- Kéo bản mới về local

![8](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_8.png) 

![9](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_9.png) 

- tạo file mới trên github xong đó sử dụng `git fetch ` để xem có update gì mới từ các brand khác không, sau đó sử dụng git pull để kéo về máy 

local

# Tìm hiểu về branch

Branches trong git là một tham chiếu đén một trạng thái nhất định của dự án bao gồm commit, tệp tin, thư mục. Mỗi branch có thể tồn tại song 

song và độc lập với các brand khác, cho phép các thành viên trong nhóm làm việc đồng thời trên các tính năng, sửa lỗi của dự án mà không gây

xung đột. Các lợi ích của branch:

- Phân tách công việc: Có thể tạo các branch riêng biệt để phát triển các tính năng, sửa lỗi hoặc các phiên bản mới của dự án mà không làm ảnh 

hưởng tới brand chính (thường là master hoặc main)

- Đảm báo tính ổn đinh: Có thể kiểm tra và thử nghiệm các tính năng mới hoặc các sửa lỗi trong một branch riêng biệt trước khi hợp nhất vào 

branch chính.

- Quản lý các phiên bản: Có thể tạo ra các branch để đại diện cho các phiên bản phát hành hoặc các phiên bản ổn định của dự án, giúp dễ dàng 

theo dõi và quản lý các phiên bản 

Các lệnh cơ bản : 

- git branch: Liệt kê các nhánh hiện có trong dự án.

- git branch <branch-name>: Tạo một nhánh mới với tên được chỉ định.

- git checkout <branch-name>: Chuyển đổi sang một nhánh khác.

- git merge <branch-name>: Hợp nhất các thay đổi từ một nhánh khác vào nhánh hiện tại.

- git branch -d <branch-name>: Xóa một nhánh đã hoàn thành.

# HEAD: 

HEAD là một con trỏ đặc biệt trong Git, được sử dụng để chỉ vị trí hiện tại của bạn trong repository. HEAD thường trỏ đến commit cuối cùng trên 

branch đó. HEAD trong nhanh đại diện cho commit hiện tại mà ta đang làm việc.

**Cách sử dụng**

- Xem thông tin về HEAD: Bạn có thể sử dụng lệnh git log --oneline -n 1 HEAD để xem thông tin về commit cuối cùng mà HEAD đang trỏ đến trên nhánh hiện tại.

- Chuyển đổi HEAD giữa các commit: Bằng cách sử dụng lệnh git checkout <commit-hash> hoặc git checkout <branch-name>, bạn có thể di chuyển HEAD đến commit hoặc nhánh mong muốn. Điều này cho phép bạn chuyển đổi giữa các commit khác nhau trong lịch sử của nhánh hoặc giữa các nhánh khác nhau.

- Di chuyển HEAD sang commit trước đó: Sử dụng lệnh git checkout HEAD~1 để di chuyển HEAD đến commit trước đó trong lịch sử của nhánh hiện tại. Điều này có thể hữu ích khi bạn muốn quay lại commit trước đó để kiểm tra hoặc thực hiện các thay đổi khác.

- Tạo nhánh mới từ HEAD: Bạn có thể tạo một nhánh mới từ HEAD bằng cách sử dụng lệnh git branch <new-branch-name> HEAD. Nhánh mới này sẽ được tạo từ commit hiện tại mà HEAD đang trỏ đến.

# Rename Branch:

- git switch branch_to_rename

- git branch -m <new-name>

# Delete Branch:

- git branch -d <branch_to-delete-name>

Nếu chắc chắn sẽ xóa branch này thì dùng -D

- git branch -D <branch_to-delete-name>







