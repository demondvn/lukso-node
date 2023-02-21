# lukso-node

## Build
    docker build . -t lukso
  
## Run
    docker run -d --name lukso -v /var/run/docker.sock:/var/run/docker.sock -v /mnt/blockstore/lukso:/root/lukso  -e NODE_NAME=MonPham --privileged lukso

## Doc
    [Read more](https://docs.lukso.tech/networks/l16-testnet/run-node/)