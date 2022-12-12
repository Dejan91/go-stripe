FROM golang:1.19.4-alpine as base

WORKDIR /app

RUN go install github.com/cosmtrek/air@latest

COPY . .
RUN go mod tidy

FROM base as web

WORKDIR /app/cmd/web
CMD ["air", "-c", ".air.toml"]

FROM base as api

WORKDIR /app/cmd/api
CMD ["air", "-c", ".air.toml"]