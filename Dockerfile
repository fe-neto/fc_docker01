FROM golang:1.22 AS builder

WORKDIR /usr/src/app

RUN go mod init meuProjeto
COPY . .

RUN go build -v -o /usr/local/bin/app ./...


FROM scratch

WORKDIR /usr/local/bin/

COPY --from=builder /usr/local/bin/ .

CMD ["app"]