mkdir temp
sudo apt update
sudo apt install git
# Caddy setup
wget https://github.com/caddyserver/caddy/releases/download/v2.7.5/caddy_2.7.5_linux_arm64.tar.gz > /dev/null
tar -C ./temp -xvf caddy_2.7.5_linux_arm64.tar.gz
sudo mv ./temp/caddy /usr/bin/
sudo groupadd --system caddy
sudo useradd --system \
    --gid caddy \
    --create-home \
    --home-dir /var/lib/caddy \
    --shell /usr/sbin/nologin \
    --comment "Caddy web server" \
    caddy
sudo mkdir /etc/caddy
sudo mkdir /srv/caddy
sudo cp Caddyfile /etc/caddy/
sudo cp caddy.service /lib/systemd/system
sudo systemctl daemon-reload
sudo systemctl start caddy.service
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
# Terminal restart may be required.
nvm install 21
nvm use 21
# Cleanups
rm caddy_2.7.5_linux_arm64.tar.gz
rm -rf temp
