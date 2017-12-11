#!/bin/bash

# Otput a system information page

TITLE="System Information Report For $HOSTNAME" 
CURRENT_TIME=$(date +"%x %r %Z")
TIMESTAMP="Generated $CURRENT_TIME, by $USER"

echo $TITLE
echo $TIMESTAMP