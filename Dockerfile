FROM golang:1.21-rc-bullseye AS builder
WORKDIR /golshi
COPY . .
RUN GOOS=linux GOARCH=amd64 go build -o ./main /golshi/cmd/server/main.go

FROM golang:1.21-rc-bullseye
WORKDIR /golshi
COPY --from=builder /golshi/main .
RUN chmod +x ./main