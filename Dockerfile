FROM alpine:latest

ARG PB_VERSION=0.22.3

# Install the dependencies
RUN apk add --no-cache \
    ca-certificates \
    unzip \
    wget \
    zip \
    zlib-dev \
    openssh

# Download Pocketbase and install it for AMD64
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/


# Notify Docker that the container wants to expose a port.
EXPOSE 8080

# Start Pocketbase
CMD [ "/pb/pocketbase", "serve", "--http=0.0.0.0:8080" ]
