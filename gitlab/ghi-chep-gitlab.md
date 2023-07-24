# Tìm hiểu về gitlab:

## Pipeline là gì:

- Trong gitlab, pipeline là một khái niệm quan trọng trong quá trình CI/CD. Một pipeline là một chuỗi các bước tự động được thực thi để kiểm tra, build, deploy, và test các ứng dụng phần mềm.

Khi bạn thực hiện các thay đổi vào mã nguồn trong repository của Gitlab, pipeline sẽ tự động kích hoạt. Nó bao gồm một loạt công việc (jobs) các giai đoạn(stages) liên kết với nhau theo một luồng xử lý cụ thể. Pipeline sẽ thực hiện các bước này một cách tự động theo cách bạn đã định nghĩa trước đó, từ việc kiểm tra mã nguồn, xây dựng ứng dung, triển khai thậm trí tự động kiểm tra ứng dụng sau khi triển khai.

Một pipeline có thể chứa nhiều jobs, và mỗi jobs đại diện cho một công việc cụ thể, chẳng hạn như kiểm tra mã nguồn ,xây dựng ứng dụng, hoặc triển khai lên môi trường sản phẩm. Các jobs trong pipeline có thể được thiết lập để chạy tuần tự hoặc song song, phụ thuộc vào cấu hình của bạn.

Pipeline cung cấp cho bạn một cái nhìn tổng quan về quá trình tích hợp và triển khai của mã nguồn, giúp bạn nắm trạng thái của ứng dụng và các bước kiểm tra một cách dễ dàng. Nó cũng giúp tự động hóa quy trình phát triển và giảm thiểu các sai sót do quá trình thủ công

Bước đầu tiên tiếp cận với Gitlab là truy cập Gitlab.com [link gitlab](https://about.gitlab.com/)

![ảnh1](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_1.png)

![ảnh2](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_2.png)

Giờ đã tạo 1 repository cho dự án, giờ đây có thể đưa code hoặc bất cứ gì lên đó.

Bây giờ sẽ xây dựng 1 pipeline. Vậy để tạo pipeline trong Gitlab, chúng ta cần tạo một file pipeline. Có thể tạo chúng trên gitlab interface.

![ảnh3](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_3.png)

- Để gitlab-ci có thể làm bất cứ việc gì thì ta cần chỉ định job. Với project thiết lập 1 chiếc xe ô tô. Vì vậy việc đầu tiên là chế tạo ra chiếc xe.

![ảnh4](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_4.png)

![ảnh5](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_5.png)

![ảnh6](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_6.png)

Ngay khi lưu tệp này, Gitlab Ci sẽ tự tạo pipeline của project 

![ảnh7](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_7.png)

`Cick` vào dấu đang xoay nó sẽ ra giao diện này

![ảnh8](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_8.png)

Như đã thấy trong ảnh sẽ có 1 job là `build the car`  

![ảnh9](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_9.png)

![ảnh10](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_10.png)

Thực hiện bước tiếp theo

viết `job` test 

![ảnh11](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_11.png)

1 file yml hoàn chỉnh:
```yml
stages:
  - build
  - test

build the car:
  stage: build
  script:
     - mkdir build
     - cd build 
     - touch car.txt
     - echo "chassis" > car.txt
     - echo "engine" > car.txt
     - echo "wheels" > car.txt 

test the car:
  stage: test
  script: 
    - test -f build/car.txt
#test command được sử dụng để verify file car.txt đã được tạo hay chưa.
# -f flag sử dụng để check file có tồn tại hay k
    - cd build
    - grep "chassis" car.txt
    - grep "engine" car.txt
    - grep "wheels" car.txt
# Kiểm tra xem những từ đó có trong file car.txt hay không.
```

![ảnh12](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_12.png)

![ảnh13](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_13.png)

Giờ trong pipeline của chúng ta có 2 giai đoạn `build` và `test`. Quá trình `test` đang bị false

![ảnh14](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_14.png)

Giờ chúng ta fix lại trong file yaml

![ảnh15](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_15.png)

![ảnh16](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_16.png)

Quá trình build vẫn lỗi. Vào check xem lỗi gì 

![ảnh17](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_17.png)

Bị lỗi tiếp trong quá trình test bên trong file. Giờ cùng edit lại file build

![ảnh18](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_18.png)

Tất cả các bước lỗi là để check script `test` có hoạt động hay không

![ảnh19](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_19.png)

Thực hiện thành công.

# Setup Git để sử dụng Gitlab (bao gồm SSH key)

[Setup Git để sử dụng Gitlab (bao gồm SSH key)](https://www.youtube.com/watch?v=Vmt0V6a3ppE)

# Git architechture:

Máy chủ git lab sẽ cung cấp cho chúng ta giao diện, cho phép tạo kho lưu trữ và quản lý mọi thứ liên quan đến dự án của mình. Mọi dữ liệu sẽ được lưu trữ trong database của Gitlab. Ngay sau khi tạo 1 pipeline, pipeline đó cũng được quản lý bởi Gitlab, nhưng nó sẽ được ủy quyền dến Gitlab runner. Vậy Gitlab runner sẽ làm gì:
GitLab Runner là một phần mềm mã nguồn mở của GitLab, được sử dụng để thực thi các công việc liên quan đến CI/CD (Continuous Integration/Continuous Deployment) trong dự án phần mềm. Nó hoạt động như một agent để thực hiện các bước xây dựng, kiểm tra và triển khai tự động dựa trên các mã nguồn và cấu hình được định nghĩa trong tệp ``.gitlab-ci.yml``.

Một số nhiệm vụ chính của Gitlab Runner bao gồm: 
- Thực thi Continuous Integration (CI)
- Thực hiện Continuous Deployment (CD)

Trong kiến trúc của GitLab, GitLab Server là thành phần quan trọng giữa cho phép quản lý và lưu trữ mã nguồn, quản lý dự án và triển khai các tính năng khác của GitLab.

Tác dụng chính của GitLab Server bao gồm:
- Quản lý mã nguồn: GitLab Server cung cấp môi trường cho việc quản lý mã nguồn thông qua hệ thống kiểm phiên bản Git. Nó cho phép lưu trữ mã nguồn, quản lý nhánh, theo dõi thay đổi, và hợp nhất các phiên bản mã nguồn khác nhau từ các nhà phát triển khác nhau trong dự án.
- Quản lý dự án: GitLab Server cung cấp một giao diện quản lý dự án để theo dõi tiến độ, tác giả, lịch sử thay đổi và các vấn đề liên quan đến mã nguồn. Điều này giúp các nhóm phát triển làm việc cùng nhau, giám sát quá trình phát triển và đảm bảo chất lượng mã nguồn.
- CICD: GitLab Server kết hợp tích hợp liên tục và triển khai liên tục (CI/CD) để tự động xây dựng, kiểm tra và triển khai mã nguồn. Điều này giúp cải thiện hiệu suất phát triển và giảm thiểu thời gian triển khai mã nguồn.
- Quản lý issue: GitLab Server cung cấp các công cụ quản lý vấn đề tích hợp, cho phép người dùng tạo, gán và theo dõi các vấn đề, lỗi và yêu cầu tính năng. Điều này giúp tăng cường sự hợp tác trong dự án và theo dõi tiến độ giải quyết các vấn đề.

Ngoài ra có khả năng scale up,down GitlabRunner tùy thuộc vào tình hình thực tế yêu cầu.

# Basic CI/CD workflow với Gitlab:

## CI/CD là gì:

Đây là 2 phương pháp và quy trinh liên quan đến việc tự dộng hóa các bước trong quá trình build ,testing và deploy phần mềm. 

- Continuous Integration (CI): là một quy trinh phát triển phần mềm trong đó các thành viên trong nhóm dev thường xuyền đưa mã code của họ lên hệ thống version control (Gitlab,Github). Mỗi khi có sự thay đổi trong source code, quá trình CI sẽ tự động kích hoạt việc build và tự động kiểm thử source này. Mục tiêu của CI là tạo ra môi trường liên tục phát hiện sớm các lỗi tích hợp và nâng cấp chất lượng source code.

- Continuous Deployment/Delivery (CD): Sau khi source code đã trải qua quá trình kiểm tra và build trong quá trình CI, quy trình CD tự động deploy source code này và môi trường produce (production environment) hoặc môi trường thử nghiệm (staging environment) một cách tự động. Nếu quy trình triển khai là tự động và ngay lập tức vào môi trường produce thì được gọi là Continuous Deploymen. Nếu triển khai tự động vào môi trường thử nghiệm và cần sự xác nhận của người quản trị trước khi triển khai vào môi trường sản phẩm thì được gọi là Continuous Delivery.

CI/CD là một phương pháp tự động hoá trong quá trình phát triển phần mềm, giúp tăng cường chất lượng, giảm thiểu rủi ro và nhanh chóng đưa các tính năng mới hoặc bản vá lỗi vào hoạt động. Nó đóng vai trò quan trọng trong quy trình phát triển phần mềm linh hoạt và hiệu quả.

## Lab: sử dụng nodejs và npm để xây dựng một trang web tĩnh

trước tiên cài nodejs 
[link cài nodejs)](https://medium.com/devops-with-valentine/how-to-install-node-js-and-npm-on-windows-10-windows-11-139442f90f12)

Bước tiếp theo sẽ là cài đặt gastby 
[link cài gatsby)](https://www.gatsbyjs.com/docs/quick-start/#install-the-gatsby-cli)

Kết quả cài đặt web:

![ảnh20](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_20.png)

Tạo project mới

![ảnh21](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_21.png)

![ảnh22](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_22.png)



