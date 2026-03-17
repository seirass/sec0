FROM alpine:3.10

RUN apt-get update && apt-get install -y \
    gcc \
    libc6-dev \
    --no-install-recommends

WORKDIR /app

# 1. Copy the actual filename
COPY bo_seirass.c .

# 2. Tell GCC to compile the actual filename
RUN gcc -fno-stack-protector -z execstack -m32 -o vulnerable_app bo_seirass.c

ENTRYPOINT ["./vulnerable_app"]
