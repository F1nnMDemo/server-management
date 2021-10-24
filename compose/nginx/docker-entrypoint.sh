#!/bin/bash
###########
ls -lR /gitdeploy
sh -c "nginxReloader.sh &"
exec "$@"