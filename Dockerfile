FROM i386/ubuntu:18.04

RUN apt-get update && apt-get install -y \
    gcc \
    libc6-dev \
    --no-install-recommends

WORKDIR /app

# Using "./" ensures it looks in the current build context (your repo root)
COPY ./main.c .

RUN gcc -fno-stack-protector -z execstack -m32 -o vulnerable_app main.c

ENTRYPOINT ["./vulnerable_app"]
