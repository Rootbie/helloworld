# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "trinh.thien@hcl.com" 

COPY /webapp/target/webapp.war /usr/local/tomcat/webapps

EXPOSE 8080
