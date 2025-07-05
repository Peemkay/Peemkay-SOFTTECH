#!/bin/bash

echo "Starting Peemkay SOFTTECH Development Server..."
echo

# Set consistent port for development
PORT=3001

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

# Get local IP
LOCAL_IP=$(get_local_ip)

echo
echo "Starting Flutter development server on port $PORT..."
echo
echo "Development server will be available at:"
echo "  Local:    http://localhost:$PORT"
if [ "$LOCAL_IP" != "Unable to determine IP" ]; then
    echo "  Network:  http://$LOCAL_IP:$PORT"
fi
echo
echo "Press Ctrl+C to stop the server"
echo

flutter run -d web-server --web-port=$PORT --web-hostname=0.0.0.0
