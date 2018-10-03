# systemd-docker_build-container
Scripts to build [systemd-docker](https://github.com/DonTseTse/systemd-docker) in a Docker container

- uses the default golang docker image `golang:latest`
- mount the folder in which `run_compilation.sh` lies into the container to make `handle_go_get.sh` 
  available in the container 
- Inside the container `handle_go_get.sh` 
    - run the `go get`
    - retrieves the result from /go/bin to the folder where `handle_go_get.sh` is 
- Once these operations are finished, the container shuts down; the Docker client removes it
