# Spring Cloud Eureka Server Application

## Supported tags and respective Dockerfile links
  
* [1.0.0.RELEASE](https://onegit.app/enterprise/spring-cloud-eureka-server/blob/master/Dockerfile)、[latest](https://onegit.app/enterprise/spring-cloud-eureka-server/blob/master/Dockerfile)

## Quick reference

### How to use this image

#### Start a Spring Cloud Eureka Server Application server instance

Start a Spring Cloud Config Application server instance is simple:
```
docker run -d --name config -p 8080:80 aomitech/spring-cloud-eureka-server 
```


#### Start Spring Cloud Eureka Server Application server with k8s StatefulSet

set command `/k8s-cluster-start.sh`
```
docker run -d --name config -p 8080:80 aomitech/spring-cloud-eureka-server /k8s-cluster-start.sh
```

#### Environment Variables

##### `NAME`
the workload name. default `eureka-server`

##### `NAMESPACE`
the namespace name. default `manager`

##### `REPLICAS`
the pods number. default `2`

##### `RUN_ARGS`
spring boot app run args. eg: `--eureka.environment=production`


#### the `eureka.client.service-url.defaultZone` 

```
http://${NAME}-${0..REPLICAS}.${NAME}.${NAMESPACE}/eureka

eg:
http://eureka-server-0.eureka-server.manager/eureka,http://eureka-server-1.eureka-server.manager/eureka,http://eureka-server-2.eureka-server.manager/eureka
```


