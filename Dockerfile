FROM i386/ubuntu:18.04

RUN apt-get update && apt-get install -y \
    gcc \
    libc6-dev \
    --no-install-recommends

WORKDIR /app


COPY bo_seirass.c .

RUN gcc -fno-stack-protector -z execstack -m32 -o vulnerable_app bo_seirass.c

ENTRYPOINT ["./vulnerable_app"]
