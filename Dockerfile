ARG BUILD_FROM
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Copy Python requirements file
COPY requirements.txt /tmp/

# Setup base
# Install requirements for add-on
RUN apk add --no-cache --virtual .build-dependencies git=2.43.0-r0 python3-dev=3.11.8-r0

RUN apk add --no-cache \
        py3-pip=23.3.1-r0 \
        python3=3.11.8-r0
RUN pip install --upgrade pip==23.0.1 --break-system-packages
RUN pip install -r /tmp/requirements.txt --break-system-packages

RUN git clone -b home_assistant https://github.com/smory/magiogo-iptv-server.git
RUN mkdir /app
RUN mkdir -p /data/storage
RUN mv magiogo-iptv-server/app.py /app/
RUN mv magiogo-iptv-server/client.py /app/
RUN mv magiogo-iptv-server/magiogo.py /app/
RUN mv magiogo-iptv-server/parse_season_number.py /app/
RUN mv magiogo-iptv-server/mpd_helper.py /app/
RUN mv magiogo-iptv-server/templates /app/
RUN mv magiogo-iptv-server/public /data/

RUN rmdir --ignore-fail-on-non-empty magiogo-iptv-server

RUN apk del --no-cache --purge .build-dependencies

COPY run.sh /

RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
