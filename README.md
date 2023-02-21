# lukso-node

## Build
    docker build . -t lukso
  
## Run
    docker run -it --rm --name -v /var/run/docker.sock:/var/run/docker.sock -v /mnt/blockstore/lukso:/root/lukso lukso -e NODE_NAME=MonPham --privileged lukso
