FROM ypcs/debian:buster

RUN /usr/lib/docker-helpers/apt-setup && \
    /usr/lib/docker-helpers/apt-upgrade && \
    apt-get --assume-yes install \
        libcoap2 \
        libcoap2-bin \
        libcoap2-dev \
        python3 \
        python3-pip && \
    /usr/lib/docker-helpers/apt-cleanup

RUN dpkg-divert --add --rename --divert /usr/bin/coap-client.real /usr/bin/coap-client && \
    ln -s /usr/bin/coap-client-openssl /usr/bin/coap-client

RUN adduser --disabled-password --gecos "user,,," user

USER user

RUN pip3 install pytradfri


