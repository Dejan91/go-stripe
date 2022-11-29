FROM golang:1.19.4-alpine

WORKDIR /app

COPY . .
RUN go mod tidy

EXPOSE 3000

WORKDIR /app/cmd/web

RUN go build -o /build