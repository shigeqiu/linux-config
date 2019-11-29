PID=$(ps -ef | grep $1 | grep -v grep | awk '{ print $1 }')
if [ -z "$PID" ]
 then
  echo 应用: $1 , 已关闭!
else
  kill $PID
  echo 应用: $1 关闭成功! PID: $PID!
fi
