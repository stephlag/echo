FROM java:8

MAINTAINER delivery-engineering@netflix.com

ENV FRONT50_HOST front50
ENV DECK_HOST deck
ENV ECHO_HOST echo

COPY . workdir/

WORKDIR workdir

RUN GRADLE_USER_HOME=cache ./gradlew buildDeb -x test

RUN dpkg -i ./echo-web/build/distributions/*.deb

CMD ["/opt/echo/bin/echo"]
