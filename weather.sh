#!/bin/sh
set -eux

git clone "https://$GITHUB_ACTOR:$GH_TOKEN@github.com/$GITHUB_REPOSITORY.wiki.git"

#Get commit details
author=`git log -1 --format="%an"`
email=`git log -1 --format="%ae"`
message=`git log -1 --format="%s"`


CITY=Shanghai
LANGUAGE="zh-CN"
UNIT=m
UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36"

curl \
  -H "Accept-Language: $LANGUAGE" \
  -H "User-Agent: $UA" \
  -o "Siamese_Network_MNIST.wiki/1.md" \
  wttr.in/$CITY?format=4\&$UNIT
cd Siamese_Network_MNIST.wiki
pwd
ls
cat 1.md



cd Siamese_Network_MNIST.wiki
git config --local user.email "$email"
git config --local user.name "$author" 







git commit -a -m "Add changes"
git add .
git push "https://$GITHUB_ACTOR:$GH_TOKEN@github.com/$GITHUB_REPOSITORY.wiki.git"
