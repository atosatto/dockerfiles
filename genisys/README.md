![Genisys](https://gitlab.com/uploads/group/avatar/504935/itx.png)

```
$ docker pull atosatto/genisys:latest
```

|  Available Versions | Tag Aliases  |
| --------------------|:------------:|
| 0.16.0-alpha        | latest       |

## Usage

Spin up your own genisys private Minecraft server with

```
$ docker run -d --name genisys -p 19132:19132/tcp -p 19132:19132/udp  atosatto/genisys
```

To customize the default `server.properties` and `php.ini` run

```
$ docker run -d --name genisys -v $(pwd)/myconfigdir:/genisys/config -p 19132:19132/tcp -p 19132:19132/udp atosatto/genisys
```

## Build

```
$ docker build -t atosatto/genisys .
```
