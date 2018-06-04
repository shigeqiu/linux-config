#!/bin/bash

echo "current path `pwd`"

bash  /data/server/guess-web/springboot.sh stop guess-web.jar guess-web.jar

rm -f /data/server/guess-web/guess-web.jar /data/server/guess-web/out.log

cp ~/jenkins/guess-web.jar /data/server/guess-web

cd /data/server/guess-web

echo " cd -  change directory"
echo "current path `pwd`"

bash  springboot.sh start "guess-web.jar --server.port=8080" guess-web.jar
