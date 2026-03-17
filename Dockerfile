#We use Alpine 3.10 specifically to ensure Docker Scout finds vulnerabilities
FROM alpine:3.10


RUN apk add --no-cache gcc libc-dev

WORKDIR /app

COPY bo_seirass.c .

RUN gcc -fno-stack-protector -z execstack -o vulnerable_app bo_seirass.c

ENTRYPOINT ["./vulnerable_app"]
