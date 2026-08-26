# Automatically generated documentation
Automatically generated documentation for declarative-jellyfin options

# services.declarative-jellyfin
## services.declarative-jellyfin.apikeys
### services.declarative-jellyfin.apikeys.*
#### services.declarative-jellyfin.apikeys.*.key
The API key (GUID).
WARNING: This is stored in plain text


**Type**: null or string

**Default**: `<null>`

#### services.declarative-jellyfin.apikeys.*.keyPath
Path to a file containing API key.
The key is a random GUID. To generate one, run:
```uuidgen -r | sed 's/-//g'```


**Type**: null or absolute path

**Default**: `<null>`

## services.declarative-jellyfin.backupCount
The amount of backups that gets rotated, ie. how many backups to
store before starting to delete old ones


**Type**: signed integer

**Default**: `5`

## services.declarative-jellyfin.backupDir
The directory to store backups


**Type**: string

**Default**: `"/var/lib/jellyfin/backups"`

## services.declarative-jellyfin.backups
Whether or not to make a backup before we update jellyfin configs and DB.
Disable at your own risk!


**Type**: boolean

**Default**: `true`

## services.declarative-jellyfin.cacheDir
Directory containing the jellyfin server cache,
passed with `--cachedir` see [#cache-directory](https://jellyfin.org/docs/general/administration/configuration/#cache-directory)


**Type**: absolute path

**Default**: `"/var/cache/jellyfin"`

## services.declarative-jellyfin.configDir
Directory containing the server configuration files,
passed with `--configdir` see [configuration-directory](https://jellyfin.org/docs/general/administration/configuration/#configuration-directory)


**Type**: absolute path

**Default**: `${cfg.dataDir}/config`

## services.declarative-jellyfin.dataDir
Base data directory,
passed with `--datadir` see [#data-directory](https://jellyfin.org/docs/general/administration/configuration/#data-directory)


**Type**: absolute path

**Default**: `"/var/lib/jellyfin"`

## services.declarative-jellyfin.enable
Whether to enable Jellyfin Service.

**Type**: boolean

**Default**: `false`

## services.declarative-jellyfin.group
Group under which jellyfin runs

**Type**: string

**Default**: `"jellyfin"`

## services.declarative-jellyfin.jellyfin-ffmpeg
Which jellyfin-ffmpeg package to use

**Type**: package

**Default**: `pkgs.jellyfin-ffmpeg`

## services.declarative-jellyfin.jellyfin-web
Which jellyfin-web package to use

**Type**: package

**Default**: `pkgs.jellyfin-web`

## services.declarative-jellyfin.logDir
Directory where the Jellyfin logs will be stored,
passed with `--logdir` see [#log-directory](https://jellyfin.org/docs/general/administration/configuration/#log-directory)


**Type**: absolute path

**Default**: `${cfg.dataDir}/log`

## services.declarative-jellyfin.openFirewall
Open the configured ports in the firewall for the media server.


**Type**: boolean

**Default**: `false`

## services.declarative-jellyfin.package
Which package to use. Overrides `services.jellyfin.package`

**Type**: package

**Default**: `pkgs.jellyfin`

## services.declarative-jellyfin.serverId
The ID for this server. Generate one with the following command:
`uuidgen -r | sed 's/-//g'`


**Type**: null or string

**Default**: `<null>`

## services.declarative-jellyfin.user
User account under which jellyfin runs

**Type**: string

**Default**: `"jellyfin"`


# system
Options for [services.declarative-jellyfin.system](https://github.com/Sveske-Juice/declarative-jellyfin/blob/main/documentation/system.md)

# libraries
Options for [services.declarative-jellyfin.libraries](https://github.com/Sveske-Juice/declarative-jellyfin/blob/main/documentation/libraries.md)

# encoding
Options for [services.declarative-jellyfin.encoding](https://github.com/Sveske-Juice/declarative-jellyfin/blob/main/documentation/encoding.md)

# network
Options for [services.declarative-jellyfin.network](https://github.com/Sveske-Juice/declarative-jellyfin/blob/main/documentation/network.md)

# users
Options for [services.declarative-jellyfin.users](https://github.com/Sveske-Juice/declarative-jellyfin/blob/main/documentation/users.md)

# branding
Options for [services.declarative-jellyfin.branding](https://github.com/Sveske-Juice/declarative-jellyfin/blob/main/documentation/branding.md)

# livetv
Options for [services.declarative-jellyfin.livetv](https://github.com/Sveske-Juice/declarative-jellyfin/blob/main/documentation/livetv.md)


