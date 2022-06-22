#! /usr/bin/env sh
set -e
#
#if [ -f /app/app.py ]; then
#    DEFAULT_MODULE_NAME=app.app
#fi
#MODULE_NAME=${MODULE_NAME:-$DEFAULT_MODULE_NAME}
#VARIABLE_NAME=${VARIABLE_NAME:-app}
#export APP_MODULE=${APP_MODULE:-"$MODULE_NAME:$VARIABLE_NAME"}
#
#if [ -f /gunicorn_conf.py ]; then
#    DEFAULT_GUNICORN_CONF=/gunicorn_conf.py
#fi
#export GUNICORN_CONF=${GUNICORN_CONF:-$DEFAULT_GUNICORN_CONF}

# Start Gunicorn
gunicorn --chdir app app:app -w 2 --threads 2 -b 0.0.0.0:8000
#exec gunicorn -c "$GUNICORN_CONF" "$APP_MODULE"
