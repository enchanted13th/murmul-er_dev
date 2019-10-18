FROM tomcat:8.0

ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN rm -Rf /usr/local/tomcat/webapps/ROOT
COPY /root/murmul-er_dev/murmul-er_cs/web/WEB-INF/deploy/ROOT.war /usr/local/tomcat/webapps/ROOT.war
