# Using a standard 32-bit capable base
FROM i386/ubuntu:18.04

# Install the compiler AND the necessary header files
RUN apt-get update && apt-get install -y \
    gcc \
    libc6-dev \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the source code from your repo into the container
COPY main.c .

# Compile with the flags you need
RUN gcc -fno-stack-protector -z execstack -m32 -o vulnerable_app main.c

# Set permissions (optional but good practice)
RUN chmod +x vulnerable_app

ENTRYPOINT ["./vulnerable_app"]
