# PurpurMC-Docker

Docker image running PurpurMC/Purpur

## Usage

```bash
$ docker run -d \
    -v minecraft:/home/server \
    -p 25565:25565 \
    thisredh/purpurmc
```

## Environment Variables

All of the Environment Variables:

| Variable | Value | Description |
| - | - | - |
| MC_VERSION | `1.19.2` | The Minecraft version to use |
| MC_EULA | `true` | Accepting the [EULA](https://account.mojang.com/documents/minecraft_eula) |
| MC_RAM_XMS | `1536M` | Preallocated RAM (for Purpur) |
| MC_RAM_XMX | `2048M` | Max RAM (for Purpur) |
| MC_PRE_JAR_ARGS | `<ARGS>` | Java Arg's (for experienced User's only) |
| MC_POST_JAR_ARGS | `<ARGS>` | Purpur Arg's (for experienced User's only) |
| MC_URL_ZIP_SERVER_FIILES | `<URL to archive(zip, rar, tar, ...)>` | Import files from another Server or Import Config's/Plugin's (for experienced User's only) |

## Todo

- [ ] Plugin support