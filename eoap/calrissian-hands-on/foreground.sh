#!/bin/bash

export PS1="\[\](base) \[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ \[\]"

curl -q https://raw.githubusercontent.com/eoap/kc-eoap/main/eoap/calrissian-hands-on/install.sh | sh