# docker-dogecoind
Docker image for running a dogecoin node

## Testing

```
docker-compose up --build
```

## Running in production

Please make a volume of /root/.dogecoin so the Blockchain data can be persisted. Otherwise the container will attempt to download the Dogecoin Blockchain every time the node is restarted.