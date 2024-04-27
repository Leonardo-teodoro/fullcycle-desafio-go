FROM golang:latest AS builder

WORKDIR /usr/src/app
RUN echo 'package main;import "fmt";func main() {    fmt.Println("Full Cycle Rocks!!")}' >> main.go
RUN go build main.go

FROM scratch

COPY --from=builder /usr/src/app/main .

ENTRYPOINT [ "./main" ]