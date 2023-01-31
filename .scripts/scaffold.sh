#! /bin/bash

cmd=""
path=""

read -p "Enter package name 👉 " name

if [[ -z $name ]]; then
  exit 1
else
  if [[ ! -z $(git add -A; git status --short | grep '^[MARCD]';) ]]
  then
    git stash
    tput setaf 1
    echo "stashed local changes"
    tput sgr0
  fi

  npx hygen package new --name $name
fi

yarn
