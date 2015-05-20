alias lsa="ls -lsa"

### Stubbery
# Postgresql
alias run-stubbery-postgres="docker run --name stubbery-postgres -d postgres:latest"
alias stubbery-postgres-console="docker exec -it stubbery-postgres bash"

# App
alias run-stubbery="docker run -ti -p 127.0.0.1:3000:3000 -p 127.0.0.1:3001:3001 --name stubbery --link stubbery-postgres:postgres -v ~/.vimrc:/root/.vimrc -v ~/Projects/stubbery:/Projects/stubbery -e PORT=3000 -e RAILS_ENV=development -d iancrosser/stubbery:server"
alias stubbery-console="docker exec -it stubbery bash"
alias rebuild-stubbery="docker build -t iancrosser/stubbery:server ."

### Trelora
# Mysql
alias run-trelora-mysql="docker run --name trelora-mysql -v ~/.my.cnf:/root/.my.cnf -v ~/bin/trelora-prod-dump:/usr/bin/trelora-prod-dump -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -d mysql:latest"
alias trelora-mysql-console="docker exec -it trelora-mysql bash"

# App MyTRELORA.com
alias run-gpigs-core-server="docker run -ti -p 127.0.0.1:3000:3000 -p 127.0.0.1:3001:3001 --name gpigs-core --link trelora-mysql:mysql -v ~/Projects/gpigs-core:/Projects/gpigs-core --env-file <(env | grep TRELORA) -e PORT=3000 -e RAILS_ENV=development -d iancrosser/trelora:server"
alias run-gpigs-core-server-debug="docker run -ti -p 127.0.0.1:3000:3000 -p 127.0.0.1:3001:3001 --name gpigs-core --link trelora-mysql:mysql -v ~/Projects/gpigs-core:/Projects/gpigs-core --env-file <(env | grep TRELORA) -e PORT=3000 -e RAILS_ENV=development iancrosser/trelora:server"
alias gpigs-core-console="docker exec -it gpigs-core bash"
alias rebuild-gpigs-core="docker build -t iancrosser/trelora:server ."

# Box API
alias run-box-api="docker run -ti -p 5000:5000 --name box-api --link redis:redis -v ~/Projects/box-api:/Projects/box-api --env-file <(env | grep BOX_API) -e PORT=5000 -e RACK_ENV=development -d iancrosser/trelora:box-api"
alias box-api-console="docker exec -it box-api bash"
alias rebuild-box-api="docker build -t iancrosser/trelora:box-api ."

### Redis
alias run-redis="docker run --name redis -d redis"

### Docker helpers
alias dockercleancontainers="docker ps -a --no-trunc| grep 'Exit' | awk '{print \$1}' | xargs -L 1 -r docker rm"
alias dockercleanimages="docker images --no-trunc | grep none | awk '{print \$3}' | xargs -L 1 -r docker rmi"
alias dockerclean="dockercleancontainers && dockercleanimages"

run_in_docker() {
  path=`pwd`
  if [ "${path:26:100}" = "gpigs-core" ] ; then
    docker run -it --rm --link trelora-mysql:mysql -v $path:${path:16:100} --env-file <(env | grep TRELORA) iancrosser/trelora:server $@
  else
    if [ "${path:26:100}" = "stubbery" ] ; then
      docker run -it --rm --link stubbery-postgres:postgres -v $path:${path:16:100} iancrosser/stubbery:server $@
    else
      if [ "${path:26:100}" = "box-api" ] ; then
        docker run -it --rm --link redis:redis -v $path:${path:16:100} --env-file <(env | grep BOX_API) iancrosser/trelora:box-api $@
      else
        docker run -it --rm -v $path:${path:16:100} iancrosser/${path:16:100} $@
      fi
    fi
  fi
}
