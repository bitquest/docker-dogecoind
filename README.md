# docker-dogecoind
Docker image for running a dogecoin node

## Testing

Builds dogecoind and runs a testnet node

```
docker-compose up --build
```

Confirm that the node is responding with curl
````
curl --data-binary '{"jsonrpc":"1.0","id":"curltext","method":"getblockchaininfo","params":[]}' -H 'content-type:text/plain;' http://user:hackme@127.0.0.1:44555/

````


## Running in production

Please make a volume of /root/.dogecoin so the Blockchain data can be persisted. Otherwise the container will attempt to download the Dogecoin Blockchain every time the node is restarted.

