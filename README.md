# systemd-docker build container 
Scripts to build [systemd-docker](https://github.com/DonTseTse/systemd-docker) in a Docker container

- runs the default golang Docker image `golang:latest` with the folder in which `run_compilation.sh` 
  lies bind mounted into the container to make `handle_go_get.sh` available
- `handle_go_get.sh` is run inside the container  
    - run the `go get`
    - retrieves the result from /go/bin to the folder where `handle_go_get.sh` is 
- once these operations are finished, the container shuts down; the Docker client removes it

# How To
- Clone this repository on a machine with Docker installed
- run `run_compilation.sh [<git-go-uri>]`
  - if no parameter is provided, it defaults to '' 
  - make sure to pass a `go get` compatible URI - for a github repository, the URL pattern 
    `https://github.com/<username>/<repository_name>.git` should be specified as 
    `github.com/<username>/<repository_name>`
