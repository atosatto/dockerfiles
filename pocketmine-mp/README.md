![PocketMine-MP](https://cdn.pocketmine.net/img/PocketMine-h.png)

```
docker pull atosatto/pocketmine-mp:latest
```

|  Available Versions | Tag Aliases      |
| --------------------|:----------------:|
| 1.4.1               | latest           |

## Usage

Spin up your own PocketMine-MP private Minecraft server with

```
docker run -d --name pocketmine-mp -p 19132:19132/tcp -p 19132:19132/udp  atosatto/pocketmine-mp
```

To customize the default `server.properties` and `php.ini` run

```
docker run -d --name pocketmine-mp -v $(pwd)/myconfigdir:/pocketmine/config -p 19132:19132/tcp -p 19132:19132/udp atosatto/pocketmine-mp
```

## Build

```
# Build the PocketMine-MP docker image
$ docker build -t atosatto/pocketmine-mp .
```
