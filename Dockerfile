# Download image của debian
FROM nginx

# Copy source nginx từ máy chính vào container.
COPY ./index.html /usr/share/nginx/html

# Mở port kết nối từ ngoài vào
EXPOSE 80
