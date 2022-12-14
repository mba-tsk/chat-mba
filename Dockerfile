FROM golang
WORKDIR /app
COPY ./app .
EXPOSE 8080
CMD ["go", "run", "main.go"]