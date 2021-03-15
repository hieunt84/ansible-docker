# Download image của debian
FROM nginx

# Chuẩn bị environment cho app
#ENV OE_USER='openerp'\
#OE_PATH='/home/openerp'\
#LANG='en_US.UTF-8'\
#LANGUAGE='en_US:en'\
#LC_ALL='en_US.UTF-8'\
#DEBIAN_FRONTEND=noninteractive

# Copy source nginx từ máy chính vào container.
#COPY ./index /tmp
COPY ./index.html /usr/share/nginx/html

# Thực hiện một loạt cài đặt, giải nén file v.v...
#RUN set -x \
#&& mkdir /usr/share/man/man1 \
#&& apt-get update \
#&& apt-get upgrade -y \
#&& tar xzf /tmp/openerp6.tar.gz -C ${OE_PATH} \
#......

# Khai báo các volume được phép link từ máy chính
#VOLUME ["/root/webs/", "/usr/share/nginx/html"]

# Mở port kết nối từ ngoài vào
EXPOSE 80
# Câu lệnh thực thi khi container bắt đầu chạy.
#CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]