#!/usr/bin/env bash
PROJECT_HOME=/home/admin/app/
JAR_DIR=${PROJECT_NAME}-core/target
JAR_NAME=${PROJECT_NAME}.jar
cd ${PROJECT_HOME}
ls
mvn clean install -Dmaven.test.skip&& mvn package -Dmaven.test.skip
cd ${JAR_DIR}
DOMO_PID=`ps -ef | grep "DOMO" | grep -v grep | awk '{print $2}'`
echo "DOMO PID = $DOMO_PID"
#kill -9 DOMO_PID
java -jar ${JAR_NAME} --spring.profiles.active=${ENV}
echo "========Build successful======="