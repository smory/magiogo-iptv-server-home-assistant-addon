
ARG BUILD_FROM=hassioaddons/base-python:13.1.2
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Copy Python requirements file
COPY requirements.txt /tmp/
#COPY app.py /

# Setup base
# Install requirements for add-on
RUN \
\
    apk add --no-cache --virtual .build-dependencies \
        build-base=0.5-r3 \
        git=2.43.0-r0 \
        py3-wheel=0.42.0-r0 \
        python3-dev=3.11.6-r1 \
    \
    && apk add --no-cache \
 #       py3-bcrypt=4.1.1-r0 \
 #       py3-cryptography=41.0.7-r0 \
        py3-pip=23.3.1-r0 \
        python3=3.11.6-r1 \
    && pip install --upgrade pip==23.0.1 --break-system-packages \
    && pip install -r /tmp/requirements.txt --break-system-packages

COPY run.sh /

RUN chmod a+x /run.sh
CMD [ "/run.sh" ]