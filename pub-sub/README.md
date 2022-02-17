```javascript
app.get('/dapr/subscribe', (_req, res) => {
    res.json([
        {
            topic: "A",
            route: "A"
        },
        {
            topic: "B",
            route: "B"
        }
    ]);
});
```
```javascript
app.post('/A', (req, res) => {
    console.log("A: ", req.body)
    res.sendStatus(200);
});
```

### how to publish
```javascript
const publishUrl = `http://localhost:3500/v1.0/publish/<topic>`;
request({uri: publishUrl, method: 'POST', json: <message>});
```