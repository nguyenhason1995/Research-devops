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

![ảnh23](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_23.png)

cài gastby cli
```php
npm install -g gatsby-cli
```
[link cài cli)](https://www.gatsbyjs.com/docs/reference/gatsby-cli/)

**build project sử dụng GitlabCI**

![ảnh24](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_24.png)

![ảnh25](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_25.png)

Hướng dẫn link từ vscode tới gitlab:
[link](https://www.youtube.com/watch?v=eWo9C2DXX5c)

![ảnh26](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_26.png)

![ảnh27](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_27.png)

Lỗi này!!! do chưa cài image cho npm

![ảnh28](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_28.png)

![ảnh29](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_29.png)

sửa lại code 1 chút!!

![ảnh30](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_30.png)

Sau khi edit đã build thành công.

**Add stage test**

![ảnh31](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_31.png)

Mục đích grep ra nếu có kq là đúng, nếu exit trả ra là 1 thì false

**Running job in parallel**

![ảnh32](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_32.png)

**Run job background**
Sử dụng lệnh `&` để chạy background

```yaml
stages:
  - build
  - test
build website:
  stage: build
  image: node:18
  script: 
    - npm install 
    - npm install -g gatsby-cli
    - gatsby build 
  artifacts:
    paths:
      - ./public

test artifacts:
  image: alpine
  stage: test
  script: 
    - grep -q "Gatsby" ./public/index.html

test website:
  image: node
  stage: test
  script:
    - npm install
    - npm install -g gatsby-cli
    - gatsby serve &
    - sleep 3
    - curl "http://localhost:9000" | tac | tac | grep -q "Gatsby"
```

Đã build và test xong web tĩnh.

**Deploy sử dụng surge.sh**

Surge là gì: 

Surge là một dịch vụ cung cấp hosting tĩnh cho các trang web. Nó cho phép bạn dễ dàng triển khai các trang web tĩnh (không có máy chủ phía sau, chỉ gồm các tập tin HTML, CSS, JavaScript và hình ảnh) lên internet một cách nhanh chóng và đơn giản.

![ảnh34](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_34.png)

![ảnh35](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_35.png)

**Quản lý secret**

Thông thường sẽ không muốn lưu giữ những thông tin cần bảo mật (username hay password hay token). Đây là những nội dụng nhạy cảm. Và gitlab đề xuất 1 giải pháp để lưu trữ những thông tin nhạy cảm kiểu như vậy. Bây giờ mục tiêu là có thể sử dụng Gitlab CI để deploy website để search. Như chúng ta đã thấy, chúng ta tương tác với interface nơi sẽ dùng email và pasword. 

Thay vì sử dụng user và password, bạn cung cấp token và bạn có thể thu hồi lại sau đó nếu nó bị xâm phạm. Trước tiên sẽ phải tìm và tạo token. 

Tạo surge token

![ảnh36](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_36.png)

![ảnh37](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_37.png)

![ảnh38](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_38.png)

![ảnh39](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_39.png)


![ảnh40](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_40.png)

Mật khẩu thì che đi 

![ảnh41](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_41.png)

**Deploy using surge.sh và GitlabCI**

**Deploy website lên GitlabCI**

![ảnh42](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_42.png)

deploy to surge:

```yaml
image: node

stages:
  - build
  - test
  - deploy

build website:
  stage: build
  script:
    - npm install
    - npm install -g gatsby-cli
    - gatsby build
  artifacts:
    paths:
      - ./public

test artifacts:
  image: alpine
  stage: test
  script:
    - grep -q "Gatsby" ./public/index.html

test website:
  stage: test
  script:
    - npm install
    - npm install -g gatsby-cli
    - gatsby serve &
    - sleep 3
    - curl "http://localhost:9000" | tac | tac | grep -q "Gatsby"

deploy to surge: 
  stage: deploy
  script:
    - npm install --global surge
    - surge --project ./public --domain useful-cats.surge.sh
# sẽ không cần token nữa vì đã nhập và variable trên gitlab
```
**Ví dụ** :

Let's extend the pipeline and add a new stage.

== DO ==

- add a new stage called "deployment tests".

- create a new job called "test deployment"

- download the first page of the website and search for a specific string (you can use the curl command)

== QUESTION ==

`How does your .gitlab-ci.yml file look like?`
```yaml
image: node

stages:
  - build
  - test
  - deploy
  - deployment tests

....

test deployment:
  stage: deployment tests
  script:
    curl -s "https://instazone.surge.sh" | grep "Hi people"
```
== QUESTION ==
Let's find a way to improve the execution time.
== DO ==
```yaml
stages:
  - build
  - test
  - deploy
  - deployment tests

....

test deployment:
  image: alpine
  stage: deployment tests
  script:
    - apk add --no-cache curl
    - curl -s "https://instazone.surge.sh" | grep "Hi people"
```
File `.gitlab-ci.yml`

```yml
image: node

stages:
  - build
  - test
  - deploy
  - deployment tests

build website:
  stage: build
  script:
    - npm install
    - npm install -g gatsby-cli
    - gatsby build
  artifacts:
    paths:
      - ./public

test artifacts:
  image: alpine
  stage: test
  script:
    - grep -q "Gatsby" ./public/index.html

test website:
  stage: test
  script:
    - npm install
    - npm install -g gatsby-cli
    - gatsby serve &
    - sleep 3
    - curl "http://localhost:9000" | tac | tac | grep -q "Gatsby"

deploy to surge: 
  stage: deploy
  script:
    - npm install --global surge
    - surge --project ./public --domain useful-cats.surge.sh
# sẽ không cần token nữa vì đã nhập và variable trên gitlab
test deployment:
  image: alpine
  stage: deployment tests
  script:
    - apk add curl > /dev/null
    - curl -s "https://instazone.surge.sh" | grep "Hi people"
```

# Gitlab CI Fundamental

**Biến trong Gitlab**
[tài liệu tham khảo về biến trong Gitlab)](https://docs.gitlab.com/ee/ci/variables/predefined_variables.html)

Trong gitlab, các biến được sử dụng để lưu trữ các giá trị có thể được sử dụng trong quá trình thực thi các jobs trong CI/CD pipeline. Các biến này có thể chứa các thông tin như thông số cấu hình, các secret, đường dẫn file và nhiều thông tin khác.

Có 2 loại biến chính trong Gitlab CICD:

- **Biến hệ thống (System Variable)**: Đây là các biến được xác định sẵn bởi Gitlab và không cần phải tạo thủ công. Chúng chứa thông tin về môi trường thực thi và các hệ thống khác nhau. Ví dụ: `$CI_COMMIT_REF_NAME`
(tên nhánh hiện tại) `$CI_PROJECT_DIR` (đường dẫn thư mục dự án) và nhiều biến khác.
- **Biến được định nghĩa trước (Predefined Variables)**: Đây là các biến được tạo ra và được xác định sẵn trong Gitlab để hỗ trợ việc xây dựng và triển khai ứng dụng. Ví dụ: `$CI_JOB_ID` (ID của công việc), `$CI_COMMIT_SHA` (commit SHA hiện tại), và các biến khác nhau như `$CI_REGISTRY_USER`,`$CI_REGISTRY_PASSWORD` được sử dụng để truy cập vào Docker Registry
- Có thể định nghĩa các biến tùy chỉnh(Custom Variables) trong các mô tả `.gitlab-ci.yml` hoặc thông qua các giao diện người dùng của Gitlab. Điều này cho phép bạn định nghĩa các biến riêng để sử dụng trong pipeline của mình. Ví dụ, bạn có thể định nghĩa một biến "VERSION" để lưu trữ số phiên bản của ứng dụng và sử dụng nó trong các bước xây dựng và triển khai.
Việc sử dụng các biến trong GitLab CI/CD cho phép bạn truyền thông tin giữa các bước công việc, đồng bộ hóa thông tin giữa nhiều công việc, và giữ các thông tin nhạy cảm an toàn bằng cách không lưu trữ trực tiếp trong mã nguồn.

![ảnh43](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_43.png)

Những biến môi trường hay được sử dụng trong Gitlab:
```yml
$CI_COMMIT_REF_NAME: Tên nhánh (branch) hiện tại.
$CI_COMMIT_REF_SLUG: Tên nhánh hiện tại sau khi chuẩn hóa để sử dụng trong URL, host names và domain names.
$CI_COMMIT_SHA: Commit SHA (mã hash) hiện tại.
$CI_JOB_ID: ID của công việc (job).
$CI_JOB_NAME: Tên của công việc (job).
$CI_PIPELINE_ID: ID của pipeline hiện tại.
$CI_PROJECT_DIR: Đường dẫn đến thư mục dự án trên runner.
$CI_PROJECT_NAME: Tên dự án.
$CI_REGISTRY_USER: Tên người dùng cho Docker Registry.
$CI_REGISTRY_PASSWORD: Mật khẩu cho Docker Registry.
$CI_COMMIT_TAG: Tag của commit hiện tại (chỉ tồn tại khi commit là một tag)
```
**Pipeline trigger**

Có thể hẹn lịch trigger tự động

![ảnh44](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_44.png)

![ảnh45](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_45.png)

![ảnh46](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_46.png)

**Sử dụng cache để tối ưu tốc độ**

Một số job cần rất nhiều time để chạy. Nó cần tải xuống một số phụ thuộc trước khi có thể chạy khiến cho tốc độ chậm. Sử dụng bộ nhớ cache có thể tăng tốc độ thực thi công việc bằng cách hướng dẫn Gitlab lưu trữ một số tệp mà sau này chúng ta có thể cần dùng tới. Tất cả các cấu hình này đều nằm trong thư mục Node-Module

![ảnh47](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_47.png)

policy: pull là một cài đặt cho cache trong GitLab CI. Khi sử dụng policy: pull, cache sẽ được tải xuống (pull) vào thời điểm bắt đầu thực thi công việc và sẽ không được tải lên (push) lại vào cuối công việc. Điều này đảm bảo rằng cache sẽ luôn được cập nhật và có sẵn khi bắt đầu một công việc mới, nhưng không cần phải tải lên lại cache sau khi công việc hoàn thành.

```yaml
cache:
  key: ${CI_COMMIT_REF_SLUG}
  paths:
    - node_modules/
  policy: pull
```
policy: push là một cài đặt khác cho cache trong GitLab CI. Khi sử dụng policy: push, cache sẽ không được tải xuống (pull) vào thời điểm bắt đầu thực thi công việc, nhưng sẽ được tải lên (push) lại vào cuối công việc sau khi công việc hoàn thành.

```yaml
cache:
  key: ${CI_COMMIT_REF_SLUG}
  paths:
    - node_modules/
  policy: push
```

Trong ví dụ trên, khi một công việc bắt đầu chạy, cache không sẽ được tải xuống từ phiên bản pipeline trước đó. Công việc sẽ thực hiện tất cả công việc mà không sử dụng cache. Tuy nhiên, khi công việc hoàn thành, cache sẽ được lưu trữ và tải lên lại để sẵn sàng sử dụng trong lần chạy tiếp theo. Điều này cho phép các thay đổi được lưu giữ trong cache và sử dụng cho các lần chạy sau.


```yaml
stages:
  - build
  - test
  - deploy
  - deployment tests
  - cache

cache:
  key: ${CI_COMMIT_REF_SLUG}
  paths:
    - node_modules/
  policy: pull
  
update cache:
  stage: cache
  script:
    - npm install
  cache:
    key: ${CI_COMMIT_REF_SLUG}
    paths:
      - node_modules/
    policy: push
  only:
    - schedules
```
Cache mới này làm giảm thời gian build 

**Phân biệt giữa cache và artifact**

Cache và artifact là hai phương tiện để tăng hiệu suất và quản lý tài nguyên trong GitLab CI/CD. Tuy chúng có mục tiêu chung là giữ lại thông tin hoặc tài nguyên giữa các lần chạy, nhưng chúng được sử dụng trong các tình huống và mục đích khác nhau.

- Cache:

Sử dụng cache khi bạn muốn lưu trữ các phụ thuộc hoặc tệp tạm thời giữa các lần chạy của pipeline.
Cache hữu ích khi các phụ thuộc không thay đổi thường xuyên, và việc tải xuống chúng mất nhiều thời gian hoặc tốn tài nguyên.
Cache được lưu trữ trên máy chủ GitLab và sẽ tồn tại trong suốt chu kỳ chạy của pipeline.
Cache thường được sử dụng để lưu trữ các thư viện, gói phụ thuộc, tệp tạo sẵn, và các thành phần khác mà không thay đổi thường xuyên trong quá trình thực thi pipeline.

- Artifact:

Sử dụng artifact khi bạn muốn lưu trữ các tệp kết quả của các công việc (jobs) để chuyển tiếp cho các công việc tiếp theo trong pipeline hoặc sử dụng sau này.
Artifact có thể là bất kỳ tệp nào, ví dụ: tệp thực thi, tệp log, tệp kết quả kiểm tra, tệp phát triển, hình ảnh Docker, và nhiều hơn nữa.
Artifact được lưu trữ trên GitLab Server và có thể truy cập qua giao diện web hoặc thông qua các API.
Artifact thường được sử dụng để truyền dữ liệu giữa các giai đoạn (stages) của pipeline, hoặc để lưu trữ các tệp kết quả quan trọng để dễ dàng theo dõi và quản lý kết quả công việc.

**environment**

enviroment cho phép kiểm soát quá trình CD/ quá trình deployment. Nó có thể biết chính xác những gì deploy lên và trên môi trường nào. Chúng ta có thể biết hiện tại chúng ta đang được cài trên phiên bản hệ thống nào. 

```yaml
image: node:18

stages:
  - cache
  - build
  - test
  - deploy staging
  - deploy production
  - production test


cache:
  key: ${CI_COMMIT_REF_SLUG}
  paths:
    - node_modules/
  policy: pull
  
update cache:
  stage: cache
  script:
    - npm install
  cache:
    key: ${CI_COMMIT_REF_SLUG}
    paths:
      - node_modules/
    policy: push
  only:
    - schedules

build website:
  stage: build
  script:
    - echo $CI_COMMIT_SHORT_SHA
    - npm install
    - npm install -g gatsby-cli
    - gatsby build
    - sed -i "s/%%VERSION%%/$CI_COMMIT_SHORT_SHA/" ./public/index.html
  artifacts:
    paths:
      - ./public

test artifact:
  image: alpine
  stage: test
  script:
    - grep -q "Gatsby" ./public/index.html

test website:
  stage: test
  script:
    - npm install
    - npm install -g gatsby-cli
    - gatsby serve &
    - sleep 3
    - curl "http://localhost:9000" | tac | tac | grep -q "Gatsby"

deploy staging: 
  stage: deploy staging
  environment: 
    name: staging
    url: sonnh5-staging.surge.sh
  script:
    - npm install --global surge
    - surge --project ./public --domain sonnh5-staging.surge.sh

deploy production: 
  stage: deploy production
  environment: 
    name: production
    url: sonnh5.surge.sh
  when: manual
  allow_failure: false
  script:
    - npm install --global surge
    - surge --project ./public --domain sonnh5.surge.sh

production test:
  image: alpine
  stage: production test
  script:
    - apk add --no-cache curl
    - curl -s "https://sonnh5.surge.sh" | grep -q "gatsby"

```

**Define variable**

![ảnh48](https://github.com/tuhocdevops/research-devops/blob/main/gitlab/image/Screenshot_48.png)




























