FROM ubuntu:22.04

# Install dependencies
RUN apt update && \
    apt install -y g++ make cmake curl libboost-all-dev && \
    apt clean

WORKDIR /app

# Copy project files
COPY . .

# Download latest Crow single-header (v1.3.0)
RUN mkdir -p include && \
    curl -fsSL "https://github.com/CrowCpp/Crow/releases/download/v1.3.0/crow_all.h" \
        -o include/crow.h

# Build your backend
RUN make

EXPOSE 18080

CMD ["./cube_backend"]
