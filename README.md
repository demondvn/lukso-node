# lukso-node

## Build
    docker build . -t lukso
  
## Run
    docker run -d --name lukso -v /mnt/blockstore/lukso:/root/.lukso -e NODE_NAME=MonPham lukso
