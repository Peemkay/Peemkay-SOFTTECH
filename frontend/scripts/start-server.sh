#!/bin/bash

echo "Starting Peemkay SOFTTECH Portfolio Website..."
echo

# Set consistent port
PORT=3000

# Function to get local IP
get_local_ip() {
    if command -v ip &> /dev/null; then
        ip route get 1 | awk '{print $7; exit}'
    elif command -v ifconfig &> /dev/null; then
        ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | head -1
    else
        echo "Unable to determine IP"
    fi
}

# Check if port is already in use
if lsof -Pi :$PORT -sTCP:LISTEN -t >/dev/null ; then
    echo "Port $PORT is already in use. Trying to kill existing process..."
    lsof -ti:$PORT | xargs kill -9 2>/dev/null
    sleep 2
fi

# Build the web app
echo "Building Flutter web app..."
flutter build web
if [ $? -ne 0 ]; then
    echo "Build failed! Please check for errors."
    exit 1
fi

# Get local IP
LOCAL_IP=$(get_local_ip)

# Start the server
echo
echo "Starting server on port $PORT..."
echo
echo "Website will be available at:"
echo "  Local:    http://localhost:$PORT"
if [ "$LOCAL_IP" != "Unable to determine IP" ]; then
    echo "  Network:  http://$LOCAL_IP:$PORT"
fi
echo
echo "Press Ctrl+C to stop the server"
echo

python3 -m http.server $PORT --bind 0.0.0.0 --directory build/web
