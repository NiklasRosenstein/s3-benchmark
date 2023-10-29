FROM golang:1.21-alpine AS build
WORKDIR /build
COPY . .
RUN go build -o s3-benchmark

FROM alpine:3.14
COPY --from=build /build/s3-benchmark /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/s3-benchmark"]
