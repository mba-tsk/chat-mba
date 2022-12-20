FROM golang:1.11.4-alpine3.8 AS envir
RUN apk --no-cache add git gcc musl-dev 
WORKDIR https://github.com/mba-tsk
RUN git clone https://github.com/mba-tsk/chat-mba.git
WORKDIR https://github.com/mba-tsk
RUN go mod init
RUN go mod tidy
RUN go build -o /chat .
FROM alpine:3.8
COPY --from=envir /chat /chat
ENTRYPOINT ["/chat"]