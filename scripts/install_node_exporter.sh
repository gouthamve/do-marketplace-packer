#!/bin/bash -x
set -e
cd ~
curl -LO https://github.com/prometheus/node_exporter/releases/download/v$NE_VERSION/$NE_FILE.tar.gz
echo "$NE_CHECKSUM $NE_FILE.tar.gz" | sha256sum --check
tar xvzf $NE_FILE.tar.gz
cp $NE_FILE/node_exporter /usr/local/bin/node_exporter
chown node_exporter:prometheus /usr/local/bin/node_exporter
rm -rf $PROM_FILE.tar.gz $PROM_FILE
systemctl daemon-reload
systemctl enable node_exporter.service
