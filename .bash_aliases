alias lsa="ls -lsa"

### Stubbery
# Postgresql
alias run-stubbery-postgres="docker run --name stubbery-postgres -d postgres:latest"
alias stubbery-postgres-console="docker exec -it stubbery-postgres bash"

# App
alias run-stubbery="docker run -ti -p 127.0.0.1:3000:3000 -p 127.0.0.1:3001:3001 --name stubbery --link stubbery-postgres:postgres -v ~/.vimrc:/root/.vimrc -v ~/Projects/stubbery:/Projects/stubbery -e PORT=3000 -e RAILS_ENV=development -d iancrosser/stubbery:server"
alias stubbery-console="docker exec -it stubbery bash"

### Trelora
# Mysql
alias run-trelora-mysql="docker run --name trelora-mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -d mysql:latest"
alias trelora-mysql-console="docker exec -it trelora-mysql bash"

# App
alias run-gpigs-core-server="docker run -ti -p 127.0.0.1:3000:3000 -p 127.0.0.1:3001:3001 --name gpigs-core --link trelora-mysql:mysql -v ~/Projects/gpigs-core:/Projects/gpigs-core --env-file <(env | grep TRELORA) -e PORT=3000 -e RAILS_ENV=development -d iancrosser/trelora:server"
alias gpigs-core-console="docker exec -it gpigs-core bash"

### go.cd
# Server
alias run-gocd-server="docker run -ti -p 8153:8153 --name gocd-server -v ~/.ssh:/root/.ssh -e -d gocd/gocd-server:14.4.0-2"
alias gocd-server-console="docker exec -it gocd-server bash"

# Agent
alias run-gocd-agent="docker run -ti --name gocd-agent --link gocd-server:go-server gocd/gocd-agent"
alias gocd-agent-console="docker exec -it gocd-agent bash"

### Docker helpers

run_in_docker() {
  path=`pwd`
  if [ "${stringZ:26:100}" = "gpigs-core" ] ; then
    docker run --rm --link trelora-mysql:mysql -v /home/iancrosser/Projects/gpigs-core:/Projects/gpigs-core iancrosser/trelora:server $@
  fi
  if [ "${stringZ:26:100}" = "stubbery" ] ; then
    docker run --rm --link stubbery-postgres:postgres -v /home/iancrosser/Projects/stubbery:/Projects/stubbery iancrosser/stubbery:server $@
  fi
}
