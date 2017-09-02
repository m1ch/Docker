FROM debian:stable

### docker build -t m1ch/fhem_amd64:latest -t m1ch/fhem_amd64:5.8
### docker run -it -p 8083:8083 --name fhem -v /home/mich/.docker/fhem/fhem.cfg:/opt/fhem/fhem.cfg m1ch/fhem_amd64
### docker run --rm -it -p 8083:8083 --name fhem_b  --entrypoint bash m1ch/fhem_amd64
# docker build -t m1ch/fhem_amd64:latest -t m1ch/fhem_amd64:5.8 ~/Projects/Docker/x64/fhem
# docker run -d -p 8083:8083 --name fhem -v /home/mich/.docker/fhem/:/fhem/ m1ch/fhem_amd64

MAINTAINER m1ch 

ENV DEBIAN_FRONTEND noninteractive

ENV TZ Europe/Berlin

RUN apt-get update && apt-get install -y \
  wget \
  make \
  apt-transport-https \
  libdevice-serialport-perl \
  libio-socket-ssl-perl \
  libwww-perl \
  libxml-simple-perl \
  libcgi-pm-perl \
  libjson-perl \
  sqlite3 \
  libdbd-sqlite3-perl \
  libtext-diff-perl \
  supervisor \
  && rm -rf /var/lib/apt/lists/*

RUN  echo | cpan \
#  && cpan install cpan \
#  && cpan -fi Net::MQTT
  && cpan -fi inc::latest \
  && cpan -fi Module::Pluggable \
  && cpan -fi Net::MQTT::Simple \
  && cpan -fi Net::MQTT::Constants

RUN wget http://fhem.de/fhem-5.8.deb && \
  dpkg -i fhem-5.8.deb && \
  update-rc.d fhem enable && \
  sed -i 's#perl fhem.pl fhem.cfg#perl fhem.pl /fhem/fhem.cfg#' /etc/init.d/fhem && \
  rm fhem-5.8.deb

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 8083

#ENTRYPOINT ["service" "fhem" "start"]
WORKDIR "/opt/fhem/"

CMD ["/usr/bin/supervisord"]

