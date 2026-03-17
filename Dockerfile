# We use Alpine 3.10 specifically to ensure Docker Scout finds vulnerabilities
FROM alpine:3.10

# Alpine uses 'apk' instead of 'apt-get'
# We install 'gcc' and 'libc-dev' to compile your C code
RUN apk add --no-cache gcc libc-dev

WORKDIR /app

# Copy your vulnerable C code
COPY bo_seirass.c .

# Compile for Alpine (which uses musl libc)
RUN gcc -fno-stack-protector -z execstack -o vulnerable_app bo_seirass.c

ENTRYPOINT ["./vulnerable_app"]
