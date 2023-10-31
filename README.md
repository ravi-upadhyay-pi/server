# Azure Server Setup
This is to manage server setup for azure. It will have configurations and 
scripts to setup server with programs like caddy for http server setup, git for
CI/CD, etc.

## Web Api Servers
Caddy is used as reverse proxy on the machine.

Benefit of using Caddy is that we get free HTTPS certificates out of the box
with 0 configuration need.

Caddyfiles will be used to store the configuration for sites. One caddy file per
site will be used.

The root caddy file `/etc/caddy/Caddyfile` will have this

```
import /srv/caddy/*.caddy
```

It will be the responsibility of each site to put their Caddyfile in this 
directory.

To restart caddy run `cd /etc/caddy && caddy reload`.

In some cases running `sudo systemctl restart caddy` might be needed.
