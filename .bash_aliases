alias lsa="ls -lsa"

### Stubbery
# Postgresql
alias run-postgres="docker run --name postgres -d postgres:latest"
alias postgres-console="docker exec -it postgres bash"

# App
alias run-stubbery="docker run -ti -p 127.0.0.1:3000:3000 -p 127.0.0.1:3001:3001 --name stubbery --link postgres:postgres -v ~/.vimrc:/root/.vimrc -v ~/Projects/stubbery:/Projects/stubbery -e PORT=3000 -e RAILS_ENV=development -d iancrosser/stubbery:server"
alias stubbery-console="docker exec -it stubbery bash"
alias rebuild-stubbery="docker build -t iancrosser/stubbery:server ."

### Trelora
# Mysql
alias mysql-console="docker exec -it mysql bash"

# App MyTRELORA.com
alias gpigs-core-console="docker exec -it gpigs-core bash"

# Box API
alias box-api-console="docker exec -it box-api bash"

### Docker helpers
alias dockercleancontainers="docker ps -a --no-trunc| grep 'Exit' | awk '{print \$1}' | xargs -L 1 -r docker rm"
alias dockercleanimages="docker images --no-trunc | grep none | awk '{print \$3}' | xargs -L 1 -r docker rmi"
alias dockerclean="dockercleancontainers && dockercleanimages"

run_in_docker() {
  path=`pwd`
  if [ "${path:26:100}" = "stubbery" ] ; then
    docker run -it --rm --link postgres:postgres -v $path:${path:16:100} iancrosser/stubbery:server $@
  else
    ./run_in_docker.sh $@
  fi
}
alias rid=run_in_docker

rails() {
  rid rails $@
}

rake() {
  rid rake $@
}
