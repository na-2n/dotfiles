#!/bin/sh

if [ "$(pgrep openvpn)" ]; then
    echo "  vpn"
else
    echo "  no vpn"
fi
