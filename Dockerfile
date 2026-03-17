FROM i386/ubuntu:18.04
RUN apt-get update && apt-get install -y gcc
COPY . /app
WORKDIR /app
RUN gcc -fno-stack-protector -z execstack -m32 -o vulnerable_app main.c
ENTRYPOINT ["./vulnerable_app"]
