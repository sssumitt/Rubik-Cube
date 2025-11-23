FROM ubuntu:22.04

RUN apt update \
 && apt install -y g++ make cmake curl libboost-all-dev

WORKDIR /app
COPY . .

# Download Crow v1.0+4 (same version your working Dockerfile used)
RUN mkdir -p include && \
    curl -fsSL "https://github.com/CrowCpp/Crow/releases/download/v1.0%2B4/crow_all.h" \
        -o include/crow.h

RUN make

EXPOSE 5050
CMD ["./cube_backend"]
