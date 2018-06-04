#!/bin/bash

echo "当前路径`pwd`"

bash  /data/server/guess-web/springboot.sh stop guess-web.jar guess-web.jar

rm -f /data/server/guess-web/guess-web.jar /data/server/guess-web/out.log

cp guess-web/target/guess-web.jar /data/server/guess-web

cd /data/server/guess-web

echo "cd后的当前路径`pwd`"

bash  springboot.sh start guess-web.jar guess-web.jar
