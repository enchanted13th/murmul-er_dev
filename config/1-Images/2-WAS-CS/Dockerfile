FROM tomcat:8.5

ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN rm -Rf /usr/local/tomcat/webapps/ROOT
COPY _ROOT.war /usr/local/tomcat/webapps/ROOT.war
