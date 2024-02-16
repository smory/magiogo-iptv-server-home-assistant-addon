#!/usr/bin/with-contenv bashio

bashio::log.info "Magio env:"
export MAGIO_USERNAME=$(bashio::config "user_name")
export MAGIO_PASSWORD=$(bashio::config 'password')
export MAGIO_GUIDE_DAYS=$(bashio::config 'tv_guide_days')
export MAGIO_GUIDE_REFRESH_HOURS=$(bashio::config 'tv_guide_refresh_hours')
export MAGIO_QUALITY=$(bashio::config 'quality')
export MAGIO_DEBUG=$(bashio::config 'debug')
env | grep MAGIO
python3 --version
pip
flask