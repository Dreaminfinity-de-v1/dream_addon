# Dream Addon
Dream Addon from [Dreaminfinity.de](https://discord.gg/gHQGjByEtR)(click for Discord)<br>
Utils for FiveM and es_extended. Add new commands, functions and more

## Exports functions
### Client
- `triggerSyncServerCallback(function name, args)`

### Server
- `triggerSyncClientCallback(function name, args)`

## Server Events
### dream_addon:IsAceAllowed with a list of permissions:
local allAllowed, hasPermissions = exports.dream_addon:triggerSyncServerCallback('dream_addon:isAceAllowed', permissionsList)
``` lua
permissionsList = {'permission_1', 'permission_2', 'permission_3'}
local allAllowed, hasOnePermission, hasPermissions = exports.dream_addon:triggerSyncServerCallback('dream_addon:isAceAllowed', permissionsList)

allAllowed -- bool
hasOnePermission -- bool
hasPermissions -- {'permission_1' = bool, 'permission_2' = bool, 'permission_3' = bool}
```

### dream_addon:IsAceAllowed with a one permission:
local hasPermission = exports.dream_addon:triggerSyncServerCallback('dream_addon:IsAceAllowed', permission)
``` lua
permission = 'permission_1'
local hasPermission = exports.dream_addon:triggerSyncServerCallback('dream_addon:IsAceAllowed', permission)

hasPermission -- bool
```

## Commands
### In-Game
- ``/removeitem`` Remove item from user
- ``/removeweapon`` Remove weapon from user
- ``/removeaccountmoney`` Remove money from account

## Required
* [es_extended V1 Final](https://github.com/esx-framework/es_extended/tree/v1-final) (Tested with v1.2.0)
