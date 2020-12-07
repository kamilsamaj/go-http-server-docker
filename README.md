# Go HTTP server running in Docker
Demonstration of an extremely small Docker image holding only 1 statically built binary

## Run
```shell
docker build -t httpserver .
docker run -p 8080:8080 httpserver
```
