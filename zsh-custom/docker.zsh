# grants shell access into Linux VM that Docker uses (press <ENTER> after running the command)
alias xhyve='screen ~/Library/Containers/com.docker.docker/Data/vms/0/tty'

# get logs from container
dlog() {
  docker container ls -a | grep "$1" | awk '{print $1}' | xargs docker logs
}

# execute bash in a running container
dbash() {
  docker container exec -it "$1" bash
}

