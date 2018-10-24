##
# Spring Cloud Eureka Server
##
FROM aomitech/spring-boot-app

ENV APP_NAME=spring-cloud-eureka-server

ADD build/bootScripts $APP_HOME/bin
ADD build/libs $APP_HOME/lib