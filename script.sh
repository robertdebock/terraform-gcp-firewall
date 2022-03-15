#!/bin/sh

apt-get -y update
apt-get -y install apache2
systemctl enable --now apache2
