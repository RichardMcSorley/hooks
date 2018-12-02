#!/bin/sh
GIT_TOKEN=a8f1438cc19260b4e266070fca446c4fcc0a5b20 # Public access only token
#rm -rf $2
echo 'https://'$GIT_TOKEN':x-oauth-basic@github.com/'$1'/'$2'.git'
git clone https://a8f1438cc19260b4e266070fca446c4fcc0a5b20:x-oauth-basic@github.com/RichardMcSorley/youtube-puppeteer.git
#docker-compose build
#docker-compose down
#docker-compose up
return