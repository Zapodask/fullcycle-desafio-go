FROM golang:1.22 AS builder

WORKDIR /app

COPY go.mod main.go ./

RUN go build -o /app/main .

FROM scratch

COPY --from=builder /app/main /app/main

CMD ["/app/main"]
