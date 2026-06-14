#!/usr/bin/with-contenv bashio

CONFIG=/data/options.json

export BLE_ADDRESS=$(bashio::config 'ble_address')
export MQTT_HOSTNAME=$(bashio::config 'mqtt_hostname')
export MQTT_PORT=$(bashio::config 'mqtt_port')
export MQTT_TOPIC_PREFIX=$(bashio::config 'mqtt_topic_prefix')
export ALLOW_PAIRING=$(bashio::config 'allow_pairing')

MQTT_RETAIN=$(bashio::config 'mqtt_retain')
export MQTT_RETAIN=$([ "$MQTT_RETAIN" = "true" ] && echo "1" || echo "0")

MQTT_USERNAME=$(bashio::config 'mqtt_username')
MQTT_PASSWORD=$(bashio::config 'mqtt_password')
[ -n "$MQTT_USERNAME" ] && export MQTT_USERNAME
[ -n "$MQTT_PASSWORD" ] && export MQTT_PASSWORD

bashio::log.info "Connexion à la Stanmore II ($BLE_ADDRESS) via MQTT ($MQTT_HOSTNAME:$MQTT_PORT)..."

exec python3 -m marshallstanmore2
