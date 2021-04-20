FROM golang:1.12-alpine AS build
RUN mkdir -p /api
WORKDIR /api
RUN apk update && apk add alpine-sdk git && rm -rf /var/cache/apk/*
COPY go.mod .
COPY go.sum .
RUN go mod download

COPY . .
RUN go build -o ./bin/gin ./httpd/main.go

FROM alpine:3.13  
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=build /api/bin/gin .
EXPOSE 8080
CMD ["./gin"]  
