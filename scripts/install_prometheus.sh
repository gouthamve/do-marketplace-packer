#!/bin/bash -x
set -e
cd ~
curl -LO https://github.com/prometheus/prometheus/releases/download/v$PROM_VERSION/$PROM_FILE.tar.gz
echo "$PROM_CHECKSUM $PROM_FILE.tar.gz" | sha256sum --check
tar xvzf $PROM_FILE.tar.gz
cp $PROM_FILE/prometheus /usr/local/bin/
cp $PROM_FILE/promtool /usr/local/bin/
chown prometheus:prometheus /usr/local/bin/prometheus
chown prometheus:prometheus /usr/local/bin/promtool
cp -r $PROM_FILE/consoles /etc/prometheus
cp -r $PROM_FILE/console_libraries /etc/prometheus
chown -R prometheus:prometheus /etc/prometheus/consoles
chown -R prometheus:prometheus /etc/prometheus/console_libraries
rm -rf $PROM_FILE.tar.gz $PROM_FILE
systemctl daemon-reload
systemctl enable prometheus.service

