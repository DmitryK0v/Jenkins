FROM gradle:7.3.3-jdk11 as build

COPY --chown=gradle:gradle . /home/gradle/src

WORKDIR /home/gradle/src

RUN gradle clean --warning-mode=all

RUN gradle build -x test


FROM i386/tomcat:9-jre11-slim as production

EXPOSE 8080

RUN rm -rf /usr/local/tomcat/webapps/ROOT

COPY --from=build /home/gradle/src/build/libs/*.war /usr/local/tomcat/webapps/ROOT.war

CMD ["catalina.sh", "run"]
