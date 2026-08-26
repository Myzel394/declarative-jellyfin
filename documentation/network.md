# network
## network.autoDiscovery
Enable auto discovery

**Type**: boolean

**Default**: `true`

## network.baseUrl
Add a custom subdirectory to the server URL. For example: http://example.com/<baseurl>

**Type**: string

**Default**: `""`

## network.certificatePassword
If your certificate requires a password, please enter it here.

**Type**: string

**Default**: `""`

## network.certificatePath
Path to a PKCS #12 file containing a certificate and private key to enable TLS support on a custom domain.

**Type**: string or absolute path

**Default**: `""`

## network.enableHttps
Whether to enable Enable HTTPS.

**Type**: boolean

**Default**: `false`

## network.enableIPv4
Enable IPv4 routing

**Type**: boolean

**Default**: `true`

## network.enableIPv6
Enable IPv6 routing

**Type**: boolean

**Default**: `false`

## network.enablePublishedServerUriByRequest
Whether to enable Enable published server uri by request.

**Type**: boolean

**Default**: `false`

## network.enableRemoteAccess
Enable remote access

**Type**: boolean

**Default**: `true`

## network.enableUPnP
Whether to enable Enable UPnP forwarding.

**Type**: boolean

**Default**: `false`

## network.ignoreVirtualInterfaces
Ignore virtual interfaces

**Type**: boolean

**Default**: `true`

## network.internalHttpPort
The TCP port number for the HTTP server.

**Type**: 16 bit unsigned integer; between 0 and 65535 (both inclusive)

**Default**: `8096`

## network.internalHttpsPort
The TCP port number for the HTTPS server.

**Type**: 16 bit unsigned integer; between 0 and 65535 (both inclusive)

**Default**: `8920`

## network.isRemoteIPFilterBlacklist
Whether to enable Is the remote ip filter list a blacklist or a whitelist.

**Type**: boolean

**Default**: `false`

## network.knownProxies
A list of known proxies

**Type**: list of string

**Default**: `[]`

## network.localNetworkAddresses
List of interface addresses which Jellyfin will bind to. If empty, all interfaces will be used.


**Type**: list of string

**Default**: `[]`

## network.localNetworkSubnets
List of IP addresses or IP/netmask entries for networks that will be considered on local network when enforcing bandwidth restrictions.
If set, all other IP addresses will be considered to be on the external network and will be subject to the external bandwidth restrictions.
If left empty, only the server's subnet is considered to be on the local network.


**Type**: list of string

**Default**: `[]`

## network.publicHttpPort
The public port number that should be mapped to the local HTTP port.

**Type**: 16 bit unsigned integer; between 0 and 65535 (both inclusive)

**Default**: `8096`

## network.publicHttpsPort
The public port number that should be mapped to the local HTTPS port.

**Type**: 16 bit unsigned integer; between 0 and 65535 (both inclusive)

**Default**: `8920`

## network.publishedServerUriBySubnet
Override the URI used by Jellyfin, based on the interface, or client IP address.

For example: `["internal=http://jellyfin.example.com" "external=https://jellyfin.example.com"]` or `["all=https://jellyfin.example.com"]`


**Type**: list of string

**Default**: `[]`

## network.remoteIpFilter
List of IP addresses or IP/netmask entries for networks that will be allowed to connect remotely.
If left empty, all remote addresses will be allowed.


**Type**: list of string

**Default**: `[]`

## network.requireHttps
Whether to enable Require HTTPS.

**Type**: boolean

**Default**: `false`

## network.virtualInterfaceNames
List of virtual interface names

**Type**: list of string

**Default**: 
```nix
[
 "veth"
]
```
