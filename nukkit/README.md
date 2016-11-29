![Nukkit](https://github.com/Nukkit/Nukkit/raw/master/images/banner.png)

```
$ docker pull atosatto/nukkit:latest
```

|  Available Versions | Tag Aliases  |
| --------------------|:------------:|
| 1.0-dev             | latest       |

## Usage

Spin up your own Nukkit private Minecraft PE server with

```
$ docker run -d --name nukkit -p 19132:19132/tcp -p 19132:19132/udp  atosatto/nukkit
```

To customize the default `server.properties` and `nukkit.yml` run

```
$ docker run -d --name nukkit -v $(pwd)/myconfigdir:/nukkit/config -p 19132:19132/tcp -p 19132:19132/udp atosatto/nukkit
```

## Build

```
$ docker build -t atosatto/nukkit .
```
