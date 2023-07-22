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

# Thực hành git branch:
![10](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_10.png) 

![11](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_11.png) 

![12](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_12.png) 

![13](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_13.png) 

![14](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_14.png) 

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

# Thực hành rename branch và delete branch

![15](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_15.png) 


![16](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_16.png) 

# Merge:
Có 3 loại merge:

- Fast Forward Merge

- Multi Branch Commit Merge with no conflict

- Multi Branch Commit Merge with a conflict

# Ví dụ minh họa:

- Fast Forward Merge

![17](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_17.png) 


- Multi Branch Commit Merge with no conflict

tuy update trên multi branch nhưng khi update lại không ảnh hưởng đến file chung (tạo mới) nên nó không bị 

conflict

![18](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_18.png) 

![19](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_19.png) 

- Multi Branch Commit Merge with a conflict

![20](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_20.png) 

# Git diff:

Khi làm việc với nhiều branch hoặc nhiều file version, đây là công cụ hiệu quả có thể hiện thị điểm khác 

nhau giữa các version. Nó giúp show ra điểm khác biệt giữa các version trong 1 file.

**Symtax của git diff**

![21](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_21.png) 

**Ví dụ**

![22](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_22.png) 

# Undoing changes (hoàn tác các thay đổi)

**Git checkout, git detached**
rong Git, lệnh git checkout được sử dụng để thực hiện các hành động sau:

Chuyển đổi giữa các nhánh: Khi bạn muốn chuyển từ một nhánh sang nhánh khác, bạn có thể sử dụng git checkout <tên-nhánh>. Ví dụ: git checkout feature-branch.

Tạo và chuyển đổi nhánh mới: Nếu bạn muốn tạo một nhánh mới và chuyển đến nhánh đó ngay lập tức, bạn có thể sử dụng git checkout -b <tên-nhánh-mới>. Ví dụ: git checkout -b new-feature.

Điều hướng đến một commit cụ thể: Bằng cách sử dụng git checkout <commit-id>, bạn có thể điều hướng tới một commit cụ thể trong lịch sử của dự án. Tuy nhiên, hãy lưu ý rằng bạn sẽ ở trong trạng thái "detached HEAD", không nằm trên bất kỳ nhánh nào.

Khôi phục các tệp hoặc thư mục từ các phiên bản trước đó: Bạn có thể sử dụng git checkout để khôi phục các tệp hoặc thư mục từ các commit trước đó. Ví dụ: git checkout <commit-id> -- tên-tệp để khôi phục một tệp cụ thể từ commit đó.

Lưu ý rằng các phiên bản Git mới đã bổ sung các hành động khác và khuyến nghị sử dụng git switch và git restore thay thế cho một số tình huống nhất định, nhưng git checkout vẫn là một trong những lệnh quan trọng và được sử dụng rộng rãi trong các phiên bản trước đó.

**Note**
Git checkout có thể move sang branch khác hoặc 1 commit khác trong branch 

**Ví dụ**

![23](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_23.png)

git log:

![24](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_24.png)

git log --oneline

![25](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_25.png)

![26](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_26.png)

## git restore

![28](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_28.png)

viết lên file:

![29](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_29.png)

![30](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_30.png)


**Sử dụng Head source**

![31](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_31.png)

![32](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_32.png)

**Note**: restore để rollback file. Và file không được ***commit***

## git reset

- Git reset cho phép xóa commit và reset branch 

Có 2 loại reset :
`git reset ########`
- xóa commit phía trước, file không thay đổi.

`git reset ######## --hard`
- xóa commit và thay đổi trong file.

**VÍ DỤ**
![33](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_33.png)

![34](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_34.png)

Reset về "two commit"

![35](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_35.png)

đã remove commit nhưng file không thay đổi, giờ cùng kiểm tra commit trong git log

![36](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_36.png)

Sau đó add lại nội dùng trong file và update lại commit 

![37](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_37.png)

Giờ reset lại về two commit nhưng thêm trường hard (sẽ xóa file về trạng thái đó)

![38](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_38.png)

# Git revert:
Sử dụng khi muốn roll back lại commit trước đấy nhưng không muốn xóa commit đó đi. Thay vào đó sẽ tạo ra một commit mới tương tự như commit muốn roll back

![39](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_39.png)

![40](https://github.com/nguyenhason1995/research-devops/blob/main/git/image/Screenshot_40.png)

# Git stash

git stash trong Git được sử dụng để tạm thời lưu trữ các thay đổi chưa được commit trong vùng làm việc của bạn mà không cần commit chúng. Khi bạn đang làm việc trên một nhánh nhưng cần chuyển sang một nhiệm vụ khác hoặc sửa lỗi trên nhánh khác, bạn có thể sử dụng git stash để tạm thời giấu đi các thay đổi hiện tại và làm việc với nhánh hoặc nhiệm vụ mới.

Khi thực hiện git stash, Git sẽ lưu trữ những thay đổi chưa được commit vào một ngăn xếp tạm thời (stash stack). Sau khi stash, thư mục làm việc của bạn sẽ trở về trạng thái trước khi bạn bắt đầu thay đổi. Bạn có thể chuyển đổi sang nhánh hoặc làm việc với các tệp tin khác mà không gây ảnh hưởng đến những thay đổi được stash.cd

Sau khi bạn đã hoàn thành công việc trên nhánh khác hoặc nhiệm vụ khác, bạn có thể quay lại nhánh ban đầu hoặc chỗ làm việc trước đó và muốn áp dụng lại các thay đổi bạn đã stash. Bạn có thể sử dụng git stash pop để áp dụng các thay đổi stash mới nhất và loại bỏ nó khỏi stash stack, hoặc sử dụng git stash apply để áp dụng các thay đổi stash mà không loại bỏ nó khỏi stash stack.

git stash là một công cụ hữu ích khi bạn muốn chuyển đổi giữa các công việc khác nhau mà không cần tạo commit tạm thời hoặc lo lắng về việc ghi đè lên các thay đổi chưa hoàn thành.

# git remote
remote từ vscode đến remote repository(không cần thiết lắm, sử dụng commandline cho tiện)

file `.gitignore` là file có chứa những file mà git hub loại bỏ

Có thể định nghĩa các file ignore: 

- Mypaswords.txt 
ignore 1 file cụ thể

- directory_name/
ignore mọi thứ trong đường dẫn 
- *.sql
ignore mọi thứ có đuôi .sql



