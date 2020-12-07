FROM golang as builder

# first copy the go.mod and go.sum and download dependencies, it will happen only if these files change
WORKDIR /app
COPY go.mod .
#COPY go.sum .
RUN go mod download

# copy rest of source files and build a binary
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -v

# create the final Docker image, it will have only 1 binary in it
FROM scratch
COPY --from=builder /app/go-http-server-docker /app/
EXPOSE 8080
ENTRYPOINT ["/app/go-http-server-docker"]
