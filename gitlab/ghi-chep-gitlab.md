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








