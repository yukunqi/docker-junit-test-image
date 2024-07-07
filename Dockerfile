# 使用官方Ubuntu镜像作为基础
FROM ubuntu:latest

# 设置环境变量
ENV DEBIAN_FRONTEND=noninteractive


# 更新包列表并安装必要的工具
RUN apt-get update && \
    apt-get install -y \
    wget \
    curl \
    gnupg \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    unzip \
    git

# 安装OpenJDK 1.8
RUN apt-get install -y openjdk-8-jdk

# 验证JDK安装
RUN java -version

# 下载并安装Maven 3.9.8
RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.8/binaries/apache-maven-3.9.8-bin.zip && \
    unzip apache-maven-3.9.8-bin.zip -d /opt && \
    rm apache-maven-3.9.8-bin.zip

# 设置Maven环境变量
ENV MAVEN_HOME=/opt/apache-maven-3.9.8
ENV PATH=$MAVEN_HOME/bin:$PATH

# 验证Maven安装
RUN mvn -version

# 设置工作目录
WORKDIR /app

# 默认命令
CMD ["bash"]