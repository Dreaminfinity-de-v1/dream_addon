ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

print('RegisterCommand: removeitem')
ESX.RegisterCommand('removeitem', 'admin', function(xPlayer, args, showError)
	args.playerId.removeInventoryItem(args.item, args.count)
end, true, {help = _U('command_removeitem'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'item', help = _U('command_removeitem_item'), type = 'item'},
	{name = 'count', help = _U('command_removeitem_count'), type = 'number'}
}})

print('RegisterCommand: removeweapon')
ESX.RegisterCommand('removeweapon', 'admin', function(xPlayer, args, showError)
    if args.playerId.hasWeapon(args.weapon) then
        showError(_U('command_removeweapon_hasalready'))
    else
        xPlayer.removeWeapon(args.weapon)
    end
end, true, {help = _U('command_removeweapon'), validate = true, arguments = {
    {name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
    {name = 'weapon', help = _U('command_removeweapon_weapon'), type = 'weapon'}
}})

print('RegisterCommand: removeaccountmoney')
ESX.RegisterCommand('removeaccountmoney', 'admin', function(xPlayer, args, showError)
	if args.playerId.getAccount(args.account) then
		args.playerId.removeAccountMoney(args.account, args.amount)
	else
		showError(_U('command_removeaccountmoney_invalid'))
	end
end, true, {help = _U('command_removeaccountmoney'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'account', help = _U('command_removeaccountmoney_account'), type = 'string'},
	{name = 'amount', help = _U('command_removeaccountmoney_amount'), type = 'number'}
}})