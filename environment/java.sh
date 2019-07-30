# 文件路径 /etc/profile.d/java.sh

JAVA_HOME=/data/software/jdk1.8.0_221
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/jre/lib/rt.jar
PATH=$PATH:$JAVA_HOME/bin
