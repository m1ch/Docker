FROM debian:stable

# docker build -t m1ch/hmland_amd64:latest -t m1ch/hmland_amd64:0.103
# docker run --privileged -p 9012:1000 --name hmland m1ch/hmland_amd64

ENV TZ Europe/Berlin

RUN apt-get update \
    && apt-get install -y wget libusb-1.0-0 \
    && rm -rf /var/lib/apt/lists/*

RUN wget --no-check-certificate https://git.zerfleddert.de/hmcfgusb/releases/debian/hmcfgusb_0.103-1_amd64.deb && \
    dpkg -i hmcfgusb_0.103-1_amd64.deb && \
    rm hmcfgusb_0.103-1_amd64.deb
    
EXPOSE 1000

ENTRYPOINT ["hmland"]

CMD ["-p 1000" ]

