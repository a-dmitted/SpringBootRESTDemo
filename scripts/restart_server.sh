#!/bin/bash

# Define variables
APP_NAME="SpringBootRESTDemo"
JAR_NAME="SpringBootRESTDemo*.jar"
APP_DIR="/opt/SpringBootRESTDemo"
LOG_FILE="$APP_DIR/app.log"

# Find the application's PID
PID=$(ps -ef | grep $JAR_NAME | grep -v grep | awk '{ print $2 }')

# If the application is running, kill it
if [ ! -z "$PID" ]; then
    echo "Stopping $APP_NAME..."
    kill $PID
    # Wait a bit to ensure the process has been killed
    sleep 5
fi