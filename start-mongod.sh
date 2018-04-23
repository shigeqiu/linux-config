#!/bin/bash

./mongod --fork --dbpath=/opt/mongodb-linux-x86_64-rhel70-3.6.4/data/db --logappend  --logpath=/opt/mongodb-linux-x86_64-rhel70-3.6.4/data/start-mongod.log --auth --bind_ip_all

## --bind_ip_all  开启所有ip访问

## --auth  开启安全认证
## --noauth 不开启安全认证
## --fork 后台运行


## --logpath   日志文件的路径
## --logappend  防止日志被删除



