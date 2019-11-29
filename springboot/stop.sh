for i  in `ls *.jar` 
   do  
     if [[ $i =~ eureka-server-3.2.0 ]] || [[ $i =~ config-3.2.0 ]] || [[ $i =~ integrated-platform-3.2.0 ]] || [[ $i =~ medical-record-3.2.0 ]] || [[ $i =~ quality-control-3.2.0 ]] || [[ $i =~ qc_manage-3.2.0 ]] || [[ $i =~ user-manage-3.2.0 ]] || [[ $i =~ user-server-3.2.0 ]] || [[ $i =~ data-visualization-3.2.0 ]] || [[ $i =~ quality-control-run-3.2.0 ]] || [[ $i =~ quality-control-oed-3.2.0 ]]
      then
        PID=$(ps -ef | grep $i | grep -v grep | awk '{ print $1 }')
	if [ -z "$PID" ]
	 then
	  echo 应用: $i , 已被关闭!
	else
          echo 应用: $i 关闭成功! PID: $PID!
	  kill $PID
	fi
     fi
   done
