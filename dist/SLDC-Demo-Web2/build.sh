#!/bin/bash

# 确保 Docker 环境已经安装
command -v docker &> /dev/null
if [ $? -ne 0 ]; then
  echo "请确保 Docker 环境已经安装"
  exit 1
fi

# 基本信息
BASE_IMAGE="nginx:alpine"
APP_SRC_DIR="/usr/share/nginx/html"
EXPOSED_PORTS="80"

# 生成 Dockerfile
echo "生成 Dockerfile..."
cat > Dockerfile <<EOF
# Use the specified base image
FROM ${BASE_IMAGE}

# Set the working directory inside the container
WORKDIR ${APP_SRC_DIR}

# Expose the specified ports
EXPOSE ${EXPOSED_PORTS}

# Copy the application source code to the working directory
COPY . ${APP_SRC_DIR}

# Define the entry point or command to run the application
CMD ["nginx", "-g", "daemon off;"]
EOF

# 构建镜像
echo "构建镜像..."
docker build -t my-nginx-image .

# 构建镜像并映射端口
echo "构建并运行容器..."
docker run -d -p 8080:80 my-nginx-image

# 等待容器启动完成
echo "等待容器启动完成..."
sleep 5

# 测试容器是否正常运行
echo "测试容器是否正常运行..."
curl http://localhost:8080

