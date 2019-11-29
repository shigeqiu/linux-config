for i  in `ls *.jar` 
   do  
     if [[ $i =~ eureka-server-3.1.0-SNAPSHOT ]] || [[ $i =~ config-3.1.0-SNAPSHOT ]] || [[ $i =~ integrated-platform-3.1.0-SNAPSHOT ]] || [[ $i =~ medical-record-3.1.0-SNAPSHOT ]] || [[ $i =~ quality-control-3.1.0-SNAPSHOT ]] || [[ $i =~ qc_manage-3.1.0-SNAPSHOT ]] || [[ $i =~ user-manage-3.1.0-SNAPSHOT ]] || [[ $i =~ user-server-3.1.0-SNAPSHOT ]] || [[ $i =~ data-visualization-3.1.0-SNAPSHOT ]]
      then
        PID=$(ps -ef | grep $i | grep -v grep | awk '{ print $2 }')
	if [ -z "$PID" ]
	 then
	  echo 应用: $i , 已被关闭!
	else
          echo 应用: $i 关闭成功! PID: $PID!
	  kill $PID
	fi
     fi
   done


if [[ ! -d logs ]]
 then mkdir logs
fi

ports=(80 8888 8781 8782 8783 8784 8785 8790 8789)
flag=0
for v in ${ports[@]}
 do
  PORT=$(lsof -i:$v| grep LISTEN  | awk '{ print $2 }')
  if [ -n "$PORT" ]
  then 
    echo Port $v is occupied! PID is $PORT
  flag=1
  fi
 done

if test $flag -eq 1
 then
   echo '端口被占用,请手动关闭被占用的端口'
   exit
fi
#启动eureka服务
for i  in `ls *.jar`
   do
      if [[ $i =~ eureka-server ]]
        then
         nohup java -Xmx80m -Xms20m  -jar $i > ./logs/$i.log 2>&1 &
         echo 应用: $i , 启动中...
         sleep 15s
      fi
   done
#启动config服务
for i  in `ls *.jar`
   do
      if [[ $i =~ config ]]
        then
         nohup java -Xmx80m -Xms20m  -jar $i > ./logs/$i.log 2>&1 &
         echo 应用: $i , 启动中...
         sleep 15s
      fi
   done
#启动其他子模块
for i  in `ls *.jar`
   do
      if [[ $i =~ integrated-platform ]] || [[ $i =~ medical-record ]] || [[ $i =~ quality-control ]] 
        then
         nohup java -Xmx400m -Xms50m  -jar $i > ./logs/$i.log 2>&1 &
         echo 应用: $i , 启动中...
      elif [[ $i =~ qc_manage ]] || [[ $i =~ data-visualization ]]
        then
         nohup java -Xmx500m -Xms50m  -jar $i > ./logs/$i.log 2>&1 &
         echo 应用: $i , 启动中... 
      elif [[ $i =~ user-manage ]] || [[ $i =~ user-server ]]
        then
         nohup java -Xmx100m -Xms30m -jar $i > ./logs/$i.log 2>&1 &
         echo 应用: $i , 启动中...
      fi
      sleep 3s
   done
sleep 10s

for i  in `ls *.jar`
   do
      if [[ $i =~ eureka-server ]] || [[ $i =~ config ]] || [[ $i =~ integrated-platform ]] || [[ $i =~ medical-record ]] || [[ $i =~ quality-control ]] || [[ $i =~ qc_manage ]] || [[ $i =~ user-manage ]] || [[ $i =~ user-server ]] || [[ $i =~ data-visualization]]
  then 
          PID=$(ps -ef | grep $i | grep -v grep | awk '{ print $2 }')
          if [ -z "$PID" ]
           then
            echo 应用: $i , 启动失败!
     flag=1
          fi
     fi
   done
if test $flag -eq 0
  then
    echo 启动成功！
fi

exit
