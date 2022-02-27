#!/bin/sh
curl --output resources_all.txt -fsSL $RESOURCES_URL
resource=$(shuf -n 1 resources_all.txt)
echo $resource
bombardier -c ${CONNECTIONS} -d ${INTERVAL} -l $resource