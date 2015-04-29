alias lsa="ls -lsa"
alias flanders="ssh -A -t iancrosser@server.showmobile.com ssh -A -t iancrosser@192.168.0.107"
alias barry="ssh -A iancrosser@iancrosser.homeip.net"

### Showmobile
alias run-showmobile="docker run -P -t -i --name showmobile -v ~/.vimrc:/root/.vimrc -v ~/Sites/showmobile:/Projects/showmobile -e -d showmobile/showmobile:latest '/bin/bash'"
alias showmobile-console="docker exec -it showmobile bash"

### Trelora
# Mysql
alias run-trelora-mysql="docker run --name trelora-mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -d mysql:latest"
alias trelora-mysql-console="docker exec -it trelora-mysql bash"

# App
alias run-gpigs-core-server="docker run -ti -p 127.0.0.1:3000:3000 -p 127.0.0.1:3001:3001 --name gpigs-core --link trelora-mysql:mysql -v ~/Projects/gpigs-core:/Projects/gpigs-core --env-file <(env | grep TRELORA) -e PORT=3000 -e RAILS_ENV=development -d iancrosser/trelora:server"
alias gpigs-core-server-console="docker exec -it gpigs-core bash"

### go.cd
# Server
alias run-gocd-server="docker run -ti -p 8153:8153 --name gocd-server -v ~/.ssh:/root/.ssh -e -d gocd/gocd-server:14.4.0-2"

# Agent
alias run-gocd-agent="docker run -ti --name gocd-agent --link gocd-server:go-server gocd/gocd-agent"

