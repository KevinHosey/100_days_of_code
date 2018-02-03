#!/bin/bash
# ssh

ls -l

USER=${USERNAME:-$(whoami)}
HOST=${HOSTNAME:-$(hostname)}

ssh -l ${USER} ${HOST} " ls -l "

exit 0
