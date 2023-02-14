# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "trinh.thien@hcl.com" 

# Change Tomcat port
RUN sed -i 's/Connector port="8080"/Connector port="4045"/' ${CATALINA_HOME}/conf/server.xml

COPY /webapp/target/webapp.war /usr/local/tomcat/webapps
