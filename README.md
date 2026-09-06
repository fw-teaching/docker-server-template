# docker-server-template

Your own personal Linux "server" for this course, running as a Docker
container on your own laptop.

Start by clicking **"Use this template"** on GitHub to create your own copy
of this repo, then clone that instead of this one.

## Setup

```
git clone <your repo's URL>
cd docker-server-template
docker compose up -d --build
```

The container prints the exact `ssh` command to use once it's ready —
check with `docker compose logs`. By default it's:

```
ssh student@localhost
```

Password: `changeme123`. To use your own username/password/port, copy
`.env.example` to `.env` and edit it before building.

Use `docker compose stop` / `start` to pause/resume — avoid `docker compose
down`, which throws away everything except your home directory.

## FAQ / things that work differently here than on a "real" server

- **No `systemctl`.** This image doesn't run systemd. Start/stop services
  with `sudo service <name> start|stop|restart` instead.
- **Services don't come back after a restart on their own.** There's no
  init system to bring them back up — just start them again with `service`.
- **Firewall tools (`ufw`, `iptables`) won't behave like a real host
  firewall** due to how container networking works, so they're out of
  scope here.
- **Only your home directory persists across a full rebuild.** Everything
  else resets to the image's contents if the container is removed and
  recreated.
