FROM golang:1.20 AS builder
WORKDIR /app
COPY . .
RUN go mod init main
RUN go build -o main .

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/main .
CMD ["./main"]

