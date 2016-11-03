FROM java:8

MAINTAINER delivery-engineering@netflix.com

ENV FRONT50_HOST front50
ENV DECK_HOST deck
ENV ECHO_HOST echo
ENV ORCA_HOST orca

ENV FRONT50_PORT 8080
ENV DECK_PORT 9000
ENV ECHO_PORT 8089
ENV ORCA_PORT 8083


COPY . workdir/

WORKDIR workdir

RUN GRADLE_USER_HOME=cache ./gradlew buildDeb -x test

RUN dpkg -i ./echo-web/build/distributions/*.deb

CMD ["/opt/echo/bin/echo"]
