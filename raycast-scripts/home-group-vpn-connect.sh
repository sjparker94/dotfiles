#!/bin/bash

# Raycast Script Command Template
#
# Duplicate this file and remove ".template." from the filename to get started.
# See full documentation here: https://github.com/raycast/script-commands
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Home Group VPN Connnect
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 🔐
# @raycast.packageName Raycast Scripts

bash "../vpnConnect.sh"
echo "Home Group VPN connected"
