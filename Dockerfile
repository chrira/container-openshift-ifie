FROM golang:1.14-alpine as builder
COPY main.go /opt/app-root/src
RUN env CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o go-hello-world-app .

FROM alpine
COPY --from=builder /opt/app-root/src/go-hello-world-app /home/golang/
EXPOSE 8080
ENTRYPOINT /home/golang/go-hello-world-app
