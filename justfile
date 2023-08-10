set shell := ["bash", "-c"]

alias d := deploy

zdir  := `mktemp`
zbin := "/run/current-system/sw/bin"
zdest := "/srv/www/gato/htroot/"
zhost := "pegwww"
zgit := "gs-xhold/simpleserver.git"

deploy:
  @echo 'Ready to clone git!'
  `rm -rf {{ zdir }}`
  `mkdir -p {{ zdir }}`
  `git clone --depth=1 --branch=master git@gogs:{{ zgit }} {{ zdir }}`
  `rm -rf {{ zdir }}/.git`
  `rm -f {{ zdir }}/.gitignore`
  `rm -f {{ zdir }}/justfile`
  `ssh {{ zhost }} "{{ zbin }}/mkdir -p {{ zdest }}"`
  rsync -aqP --delete --exclude='node_modules/' --exclude='shared/' --exclude='.direnv/' --exclude='.envrc' {{ zdir }}/ {{ zhost }}:{{ zdest }}
  `rm -rf {{ zdir }}`

install:
    #!/usr/bin/env bash
    ssh -tt {{ zhost }} 'bash -l -s' << 'ENDSSH'
    cd  {{ zdest }}
    pm2 stop process.json
    pnpm install
    pm2 start process.json
    exit
    ENDSSH
