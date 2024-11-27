FROM golang:1.23.3-alpine3.19

WORKDIR /app 

COPY . .

RUN go mod tidy
RUN go get -v -t ./...
RUN go build -o api 

CMD ["./api"]

EXPOSE 8080

