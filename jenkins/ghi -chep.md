# Jenkins

Tạo 2 jenkins:
- Jenkins master - 192.168.149.128
- Jenkins node - 192.168.149.129

**Join Jenkin-node**

Link hướng dẫn
[join slave](https://www.youtube.com/watch?v=fphtfmAsfhU)

**Jenkins security**

Mặc định khi tạo User khởi tạo jenkins sẽ là admin.

![ảnh1](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_1.png)

Để xem thông tin sẽ click vô đây

![ảnh2](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_2.png)

![ảnh3](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_3.png)

![ảnh4](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_4.png)

![ảnh5](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_5.png)

**lab**

![ảnh6](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_6.png)

Tìm hiểu về authentication và Authorization

![ảnh7](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_7.png)

![ảnh8](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_8.png)

![ảnh9](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_9.png)

![ảnh10](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_10.png)

![ảnh11](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_11.png)

Tạo 1 user `test` 

![ảnh12](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_12.png)

- Phân quyền `Authorization`

![ảnh13](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_13.png)

![ảnh14](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_14.png)

![ảnh15](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_15.png)

Người nạc danh sẽ chỉ có quyền đọc và không có quyền build

![ảnh16](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_16.png)

Khi login lại user `sonnh5` là user admin thì sẽ thấy full quyền 

Trường hợp giả sử muốn user `test` bị giới hạn quyền.

![ảnh17](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_17.png)

![ảnh18](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_18.png)

![ảnh19](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_19.png)

Giả sử muống phân quyền build cho user `test` thì làm như sau

![ảnh20](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_20.png)

![ảnh21](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_21.png)

![ảnh22](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_22.png)

![ảnh23](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_23.png)

Tạo 1 job

![ảnh24](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_24.png)

Chọn configure của job

![ảnh25](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_25.png)

![ảnh26](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_26.png)

Phân quyền cho user test

![ảnh27](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_27.png)

- Chế độ Role base Authorization strategy

Chế độ này sẽ phải cài bằng plugin, nó được sử dụng khi hệ thống có nhiều job. Khi đó sẽ không thể vào được từng job để phân quyền. Chế độ này sinh ra để xử lý vấn đề đó.

- Đầu tiên sẽ cài plugin. Sau khi cài xong thì nó sẽ hiện ra

![ảnh28](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_28.png)

Tick và ấn `save`

![ảnh29](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_29.png)

![ảnh30](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_30.png)

Trong `ManagerRoles` sẽ có 3 chế độ `Global roles` ,`item roles` và `agent roles`

Global role: giả sử quyền admin sẽ được full quyền 
Nhưng khi cấu hình tiếp `item roles` sẽ chia rõ cụ thể từng role cho mỗi chức năng
Agent role thì cho các node

Giả sử cấu hình cho user `qa`

![ảnh31](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_31.png)

![ảnh32](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_32.png)

Tạo thêm nhiều job để test `item roles` 

![ảnh33](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_33.png)

Tạo thêm tiếp 1 job nữa.

![ảnh34](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_34.png)

Giả sử quyền `qa` có quyền xem thông tin các job trong jenkins . Nhưng sẽ không thể thực thi xóa, sửa những job nào có tên là smoke test

![ảnh35](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_35.png)

Sau khi tạo xong

![ảnh36](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_36.png)

Với quyền `qa` chúng ta sẽ gán full quyền trong job `smoketest`

![ảnh37](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_37.png)

Sau khi tạo quyền xong giờ sẽ gán quyền cho user

![ảnh38](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_38.png)

![ảnh39](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_39.png)

![ảnh40](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_40.png)

khi này user test sẽ có quyền xem trên các nhóm nhưng riêng vs job smoketest sẽ có quyền build, thêm, sửa xóa job

![ảnh41](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_41.png)

![ảnh42](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_42.png)

**Configure roles**
- Regular expression
`Roger-.*`: Tất cả bắt đầu từ `Roger-` 
`(?!)roger`: Không phân biệt chữ hoa chữ thường

## Biến môi trường

Jenkin expose sẵn các biến môi trường mặc định để sử dụng 

![ảnh43](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_43.png)

![ảnh45](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_45.png)

![ảnh46](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_46.png)

![ảnh47](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_47.png)

![ảnh48](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_48.png)

Còn muốn custum biến môi trường thì :

![ảnh49](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_49.png)

![ảnh50](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_50.png)

![ảnh51](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_51.png)

![ảnh52](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_52.png)

## Build trigger

![ảnh53](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_53.png)

![ảnh54](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_54.png)

![ảnh55](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_55.png)

![ảnh56](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_56.png)

Schedule 1 phút chạy job 1 lần

**Trigger from bashcript**

Để làm được điều đó thì cần token

![ảnh58](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_58.png)

![ảnh59](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_59.png)

![ảnh60](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_60.png)

Copy token

Muốn chạy trigger trên bash sẽ chạy lệnh này:

```php
curl -X POST http://192.168.149.128:8080/job/test_job/build --user sonnh5:11fb3729763d8c5eaf4bedb69d3e455c91
```
Trong đó sonnh5 là user và sau dấu `:` là token

## Jenkins email, extend email, jenkins maven build, JUnit, Jenkin Git

Đầu tiên phải tải plugin. Các plugin cần tải:
- Maven:

![ảnh61](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_61.png)

Sau khi cài xong thì nó sẽ hiện ra 

![ảnh62](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_62.png)

![ảnh63](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_63.png)

![ảnh64](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_64.png)

![ảnh65](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_65.png)

![ảnh66](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_66.png)

![ảnh67](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_67.png)

![ảnh68](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_68.png)

**Email notification**

![ảnh71](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_71.png)

![ảnh72](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_72.png)

![ảnh73](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_73.png)

![ảnh74](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_74.png)

![ảnh75](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_75.png)

![ảnh76](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_76.png)

![ảnh77](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_77.png)

Cấu hình xác minh 2 bước

![ảnh78](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_78.png)

![ảnh79](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_79.png)

![ảnh80](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_80.png)

![ảnh81](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_81.png)

![ảnh82](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_82.png)

![ảnh83](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_83.png)

![ảnh85](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_85.png)

![ảnh86](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_86.png)

oxxliddtmfcyizpt

![ảnh87](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_87.png)

![ảnh88](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_88.png)

![ảnh89](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_89.png)

![ảnh90](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_90.png)

![ảnh91](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_91.png)

![ảnh92](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_92.png)

![ảnh93](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_93.png)

![ảnh94](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_94.png)

![ảnh95](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_95.png)

![ảnh96](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_96.png)

![ảnh97](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_97.png)

![ảnh98](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_98.png)

![ảnh99](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_99.png)

![ảnh100](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_100.png)

![ảnh101](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_101.png)

![ảnh102](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_102.png)

![ảnh103](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_103.png)

**Chạy java bằng shellscript**

![ảnh104](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_104.png)

![ảnh105](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_105.png)

Sau khi `save` xong thì ấn build

**Chạy skip test**

![ảnh106](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_106.png)

![ảnh107](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_107.png)

Sau khi `save` xong thì ấn build

## jenkins maven chạy freestype

![ảnh109](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_109.png)

![ảnh110](https://github.com/tuhocdevops/research-devops/blob/main/jenkins/image/Screenshot_110.png)

[github](https://github.com/shazforiot/HelloWorld-Springboot-App)

file cấu hình trong bashrc
```php
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.19.0.7-1.el7_9.x86_64/
export PATH=$JAVA_HOME/bin:$PATH
export MAVEN_HOME=/usr/local/apache-maven/apache-maven-3.9.4
export MAVEN=$MAVEN_HOME/bin
export PATH=$MAVEN:$PATH
```





