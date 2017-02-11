#!/bin/bash

mkdir -p /yandex-disk/data
mkdir -p /root/.config

# link /root/.config/yandex-disk -> /yandex-disk/conf/
ln --no-target-directory --force --symbolic \
    /yandex-disk/conf /root/.config/yandex-disk

# generate token
if [ -e /yandex-disk/conf/user ]; then
    username=$(cat /yandex-disk/conf/user)
    password=$(cat /yandex-disk/conf/pass)
    /usr/bin/yandex-disk token --password="$password" $username
    rm -f /yandex-disk/conf/user /yandex-disk/conf/pass
fi 

if [ "$1" = "sync" ]; then
    exec /usr/bin/yandex-disk sync --dir /yandex-disk/data
else
    exec /usr/bin/yandex-disk start --no-daemon --dir /yandex-disk/data
fi
