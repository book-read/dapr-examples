## dapr state
### concepts
LWW(last write win) strategy with ETag
### api
```
type Store interface {
    Init(metadata Metadata) error
    Delete(req *DeleteRequest) error
    BulkDelete(req []DeleteRequest) error
    Get(req *GetRequest) (*GetResponse, error)
    Set(req *SetRequest) error
    BulkSet(req []SetRequest) error
}
```
## command
### golang
```bash
dapr run --app-id hello-dapr --app-port 8088 --dapr-http-port 8089 go run main.go
http://localhost:8089/v1.0/invoke/hello-dapr/method/greeting
```
