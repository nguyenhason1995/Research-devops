FROM centos as build 
# Dung lượng của container lúc này là 204 MB
# dùng câu lệnh để set dung lượng tối đa cho 1 thư mục mà mình custom
RUN fallocate -l 10M /opt/1
RUN fallocate -l 10M /opt/2
# Sau khi build image này dung lượng sẽ là 224MB do cộng 2 file opt/1 và opt/2
RUN fallocate -l 5M /opt/jar
# Tạo thêm 1 file opt/test

FROM alpine
COPY --from=build /opt/jar /jarfile.jar
# Sau khi build thì giảm xuống còn 20MB
