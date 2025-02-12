# Laravel roadrunner starter

A Laravel starter which is focused to streamline\
the setup of your laravel project,\
while also being production ready.

## Features

- **Image options**: Alpine (~150MB) or Debian (~540MB) images.
- **Bun**: Runtime and package manager.
- **Database**: sqlite(default).
- **Roadrunner**: as php server.
- **Simple**: (optional)

## Useful to have

[Docker](https://www.docker.com/) / [Podman](https://podman.io/) /
[Colima](https://github.com/abiosoft/colima) /
[Make](https://formulae.brew.sh/formula/make#default)\
[WSL2](https://learn.microsoft.com/en-us/windows/wsl/install) /
[Network](https://learn.microsoft.com/en-us/windows/wsl/networking) /
[vite](https://vite.dev/config/server-options.html#server-watch)

## Preface

> [!NOTE]
> If you happen to use docker without Colima I would highly recommend you\
> to set docker up as
> [non-root](https://docs.docker.com/engine/install/linux-postinstall/)
> otherwise `make` will not succeed.

**Linux**\
Use your package manager which is provided by your distro to install docker or
podman and `make`.\
So for example on debian: `sudo apt install podman podman-docker make`.\
On fedora: `sudo dnf install podman podman-docker make`.

**MacOS**\
As for macOS I would highly recommend you to install
[make](https://formulae.brew.sh/formula/make#default) and
[colima](https://github.com/abiosoft/colima)\
as docker runtime to have a minimal docker installation.\
So you can run containers without root permissions.

**Windows**\
On windows I would recommend you to setup the following:
[make](https://scoop.sh/#/apps?q=make) /
[WSL2](https://learn.microsoft.com/en-us/windows/wsl/install) /
[Network](https://learn.microsoft.com/en-us/windows/wsl/networking) /
[vite](https://vite.dev/config/server-options.html#server-watch)\
to get the least painful docker / podman experience on windows.

## Install

1. **Clone the repository**

```
git clone https://forgejo.quinzx.com/quinzx/laravel-starter.git
```

After cloning the repository you can configure\
the Dockerfile and docker-compose file to your taste.

2. **Build the docker image**

```
docker compose build --no-cache
```

3. **Start up the container stack**

```
docker compose up -d roadrunner
```

4. **Setup the project**

Since I'm making use of `make` in order to simplify\
setting up the project you can do the following\
in order to create a simple laravel project.

```
make create-project
```

If you want a simple laravel project without breeze.\
You can execute `docker compose down -t 2` and then
`docker compose up -d roadrunner`.\
If not keep following the guide.

5. **Laravel setup with breeze**

The following will set up laravel breeze with bun as JS runtime.

```
make breeze
```

Once the project has been set up you can execute these commands:\
`docker compose down -t 2` and then `docker compose up -d`.\
The project will be accessible at `http://localhost:9807`.

After your are done setting up you project you can access\
the container's shell by running: `docker compose exec <container> sh`.\
So you can use bun or composer as package manager.

If `localhost` doesn't work by any chance, you can use the following
`vite.config.js` example.\
which is highly recommended for WSL2 users, or for those who want to visit the
page on other devices on the same network.\
The unmodified `vite.config.js` file should be located at
`./laravel-example/vite.config.js`.\
Make sure to change the ip to your local ip,\
and then access your site at `http://<local ip>:9807`.

```js
import { defineConfig } from "vite";
import laravel from "laravel-vite-plugin";

export default defineConfig({
  plugins: [
    laravel({
      input: [
        "resources/css/app.css",
        "resources/js/app.js",
      ],
      refresh: true,
    }),
  ],
  server: {
    host: true,
    hmr: {
      host: "192.168.0.255",
    },
  },
});
```

## To Do

- Postgres database
- bun without laravel breeze
