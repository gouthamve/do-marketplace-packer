sleep 10
groupadd prometheus
useradd -g prometheus --no-create-home --shell /bin/false prometheus
useradd -g prometheus --no-create-home --shell /bin/false node_exporter
mkdir /etc/prometheus
mkdir /var/lib/prometheus
chown prometheus:prometheus /etc/prometheus
chown prometheus:prometheus /var/lib/prometheus
chmod +x /etc/update-motd.d/99-one-click
