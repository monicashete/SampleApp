#! /bin/bash

if [ -e /appdynamics/AppServerAgent.zip ]; then
   echo -n "Adding AppDynamics App Server Agent ..."
   unzip -q /appdynamics/AppServerAgent.zip -d ${CATALINA_HOME}/appagent
   echo "Done"
fi

if [ -e ${CATALINA_HOME}/appagent/javaagent.jar ]; then
   AGENT="-javaagent:${CATALINA_HOME}/appagent/javaagent.jar"
else
   AGENT=""
fi

$(cd ${CATALINA_HOME}/bin; java ${AGENT} -cp ${CATALINA_HOME}/bin/bootstrap.jar:${CATALINA_HOME}/bin/tomcat-juli.jar org.apache.catalina.startup.Bootstrap)