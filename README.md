# systemd-docker build container 
Scripts to build [systemd-docker](https://github.com/DonTseTse/systemd-docker) (or a fork) in a Docker 
container. Useful if Golang is not available or desired on the Docker host itself.

- runs the default golang Docker image `golang:latest` with the folder in which `run_compilation.sh` 
  lies bind mounted into the container to make `handle_go_get.sh` available
- `handle_go_get.sh` is run inside the container  
    - executes the `go get` 
    - copies the result from `/go/bin` to the folder where `handle_go_get.sh` is 
- once these operations are finished, the container shuts down; the Docker client removes it
- `systemd-docker` is available in the same folder as `run_compilation.sh`

# How To
- Clone this repository on a machine with Docker installed
- run `run_compilation.sh [<git-go-uri>]`
  - if no `git-go-uri` is provided, it defaults to 'github.com/dontsetse/systemd-docker' 
  - `git-go-uri` should be a `go get` compatible URI - for a github repository, the URL pattern 
    
    `https://github.com/<username>/<repository_name>.git` 
    
    should be specified as 
    
    `github.com/<username>/<repository_name>`
