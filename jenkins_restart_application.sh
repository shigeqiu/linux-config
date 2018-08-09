#!/bin/bash

application_path="/data/server/sport/web"
application_jar_name="sport-web.jar"

jenkins_target_jar_path_name="./sport-web/target/${application_jar_name}"

springboot_shell="/data/scripts/springboot.sh"


echo "current path `pwd`"

bash $springboot_shell stop $application_jar_name  $application_jar_name

rm -f $application_path/$application_jar_name $application_path/out.log

cp $jenkins_target_jar_path_name  $application_path

cd $application_path

echo " cd -  change directory"
echo "current path `pwd`"

bash  $springboot_shell start $application_jar_name $application_jar_name
