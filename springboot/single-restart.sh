PID=$(ps -ef | grep $1 | grep -v '/bin/bash -c' | grep -v 'grep' | awk '{ print $1 }')
if [ -z "$PID" ]
 then
  echo 应用: $1 , 已关闭!
else
  echo 应用PID: $PID!
  kill $PID
  echo 应用: $1 关闭成功! PID: $PID!
fi


if [[ ! -d logs ]]
 then mkdir logs
fi
if [[ $1 =~ eureka-server ]] || [[ $1 =~ config ]]
 then
  nohup java -Xmx80m -Xms20m  -jar $1 > ./logs/$1.log 2>&1 &
elif [[ $1 =~ integrated-platform ]] || [[ $1 =~ medical-record ]] || [[ $1 =~ quality-control ]]
 then
  nohup java -Xmx400m -Xms50m  -jar $1 > ./logs/$1.log 2>&1 &
elif [[ $1 =~ qc_manage ]]
 then
  nohup java -Xmx500m -Xms50m  -jar $1 > ./logs/$1.log 2>&1 & 
elif [[ $1 =~ user-manage ]] || [[ $1 =~ user-server ]]
 then
  nohup java -Xmx100m -Xms30m -jar $1 > ./logs/$1.log 2>&1 &
else
  nohup java -jar $1 > ./logs/$1.log 2>&1 &
fi
echo 应用: $1 , 启动中...
sleep 8s

PID=$(ps -ef | grep $1 | grep -v '/bin/bash -c' | grep -v 'grep'  | awk '{ print $1 }')
if [ -z "$PID" ]
 then
  echo 应用: $1 , 启动失败!
  flag=1
 else
  echo 应用: $1 , 启动成功!
fi
