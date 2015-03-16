#!/bin/bash

nohup nodemon --exec log.io-server &> /srv/log.io-server&
nohup nodemon --exec log.io-harvester &> /srv/log.io-harvester&