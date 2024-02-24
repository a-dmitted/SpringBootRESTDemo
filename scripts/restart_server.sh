#!/bin/bash

export JAVA_HOME=/usr/java/jdk-21.0.2+13
export PATH=$PATH:$JAVA_HOME/bin

# Define variables
APP_NAME="SpringBootRESTDemo"
JAR_NAME="SpringBootRESTDemo*.jar"
APP_DIR="/opt/SpringBootRESTDemo"
LOG_FILE="$APP_DIR/app.log"

# Find the application's PID
PID=$(ps -ef | egrep $APP_NAME".*\.jar" | grep -v grep | awk '{ print $2 }')

# If the application is running, kill it
if [ ! -z "$PID" ]; then
    echo "Stopping $APP_NAME..."
    kill $PID
    # Wait a bit to ensure the process has been killed
    sleep 5
fi

# Start the application
echo "Starting $APP_NAME..."
nohup java -jar $APP_DIR/$JAR_NAME > $LOG_FILE 2>&1 &

echo "$APP_NAME started successfully."