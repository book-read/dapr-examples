# dapr-examples
## install dapr
```bash
curl -OL https://github.com/dapr/dapr/releases/download/v1.6.0/daprd_darwin_amd64.tar.gz

```
## install dapr on kubernetes
```bash
dapr init --kubernetes
```
## notice
Dapr sidecars always communicate with each other through gRPC.
When converting an HTTP request to a GRPC request, all HTTP headers are encoder into the `headers` metadata element of the gRPC request.
## questions
### how to local test
