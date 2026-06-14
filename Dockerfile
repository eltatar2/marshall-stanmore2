ARG BUILD_FROM=ghcr.io/hassio-addons/base:16.3.2
FROM $BUILD_FROM

RUN apk add --no-cache python3 py3-pip jq bluez dbus

RUN pip3 install --no-cache-dir --break-system-packages \
    "bleak>=0.22.3" \
    "aiomqtt>=2.3.2" \
    "ragdoll>=0.4.0" \
    "git+https://github.com/rabbit-aaron/marshall-stanmore-2.git"

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
