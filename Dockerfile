FROM java:8-jre

MAINTAINER delivery-engineering@netflix.com

COPY ./echo-web/build/distributions/*.deb workdir/packages/

WORKDIR workdir

RUN dpkg -i ./packages/*.deb

CMD ["/opt/echo/bin/echo"]
