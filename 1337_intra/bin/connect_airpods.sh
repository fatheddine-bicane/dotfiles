#!/bin/bash

# AirPods MAC address
AIRPODS_MAC="24:EF:C1:D0:5C:D7"

# Function to connect AirPods
connect_airpods() {
    echo "Connecting to AirPods..."
    bluetoothctl power on
    bluetoothctl agent on
    bluetoothctl default-agent
    bluetoothctl connect "$AIRPODS_MAC"
}

# Connect AirPods
connect_airpods

echo "If the connection fails, ensure your AirPods are in pairing mode."
