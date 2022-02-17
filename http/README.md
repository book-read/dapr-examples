## command
### golang
```bash
dapr run --app-id hello-dapr --app-port 8088 --dapr-http-port 8089 go run main.go
http://localhost:8089/v1.0/invoke/hello-dapr/method/greeting
```
