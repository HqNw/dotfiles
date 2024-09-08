#! /usr/bin/sh

status=$(pamixer --default-source --get-mute)


if [ $status == 'true' ]; then
  pamixer --default-source -u
  notify-send 'unmuted'
else
  pamixer --default-source -m
  notify-send 'muted'
fi;

