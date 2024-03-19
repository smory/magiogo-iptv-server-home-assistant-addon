#!/usr/bin/with-contenv bashio

export HASIO="true"
export MAGIO_USERNAME=$(bashio::config "user_name")
export MAGIO_PASSWORD=$(bashio::config 'password')
export MAGIO_SERVER_PUBLIC_URL=$(bashio::config 'host_address')
export MAGIO_GUIDE_DAYS=$(bashio::config 'tv_guide_days')
export MAGIO_GUIDE_REFRESH_HOURS=$(bashio::config 'tv_guide_refresh_hours')
export MAGIO_QUALITY=$(bashio::config 'quality')
export MAGIO_DEBUG=$(bashio::config 'debug')
export MAGIO_USE_HIGHER_DASH=$(bashio::config 'use_higher_bitrate_dash')
export MAGIO_MODIFY_DASH_MANIFEST=$(bashio::config 'remove_smaller_quality_streams_from_dash')
export MAGIO_WRITE_KODI_PROPS=$(bashio::config 'add_kodi_props_to_playlist')
export MAGIO_KODI_PROPS=$(bashio::config 'kodi_props')
export MAGIO_REMOVE_SMALLER_QUALITY_DASH=$(bashio::config 'remove_smaller_quality_streams_from_dash')
export MAGIO_LOCAL_DASH_MANIFEST=$(bashio::config 'make_dash_local_manifest_insead_of_redirect')
export MAGIO_OTT_TYPE_STREAM=$(bashio::config 'ott_type_for_steaming')
export MAGIO_STREAM_TYPE=$(bashio::config 'stream_service_type')

[ -z "$MAGIO_USERNAME" ] && $(bashio::exit.nok 'User name not set.')
[ -z "$MAGIO_PASSWORD" ] && $(bashio::exit.nok 'Password not set.')
[ -z "$MAGIO_SERVER_PUBLIC_URL" ] && $(bashio::exit.nok 'Host not set.')
[ "$MAGIO_SERVER_PUBLIC_URL" = "http://[ip]:[port]" ] && $(bashio::exit.nok 'Host not set.')

#bashio::log.info "Magio env:"
#env | grep MAGIO
cd /app
python3 -m flask run --host=0.0.0.0