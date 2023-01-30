FROM azul/zulu-openjdk-alpine:11-jre

VOLUME /tmp
WORKDIR /opt/
ADD target/*.jar app.jar
RUN sh -c 'touch app.jar'

EXPOSE 8094
ENTRYPOINT [ "sh", "-c", "java -XX:+PrintFlagsFinal -XX:+PrintGCDetails $JAVA_OPTS -Duser.timezone=GMT+08 -Djava.security.egd=file:/dev/./urandom -jar app.jar"]