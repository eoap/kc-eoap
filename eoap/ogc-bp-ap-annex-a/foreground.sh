#!/bin/bash

echo "Installing dependencies..."
while [ ! -f /tmp/finished ]; do sleep 1; done

echo "Done"

pip install stac-asset pystac

export PS1="\[\](base) \[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ \[\]"