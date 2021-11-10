local chars = {
	"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
	"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
	"0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
	"!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", ":", ";", "<", "=", ">", "?", "@", "[", "\\", "]", "^", "_", "`", "{", "|", "}", "~"
}
local clientCallbacks = {}

DreamAddon.TriggerClientCallback = function(name, scr, cb, ...)
	local otp = getRandomString()
	table.insert( clientCallbacks, { name = name, otp = otp, cb = cb } )
	TriggerClientEvent('dream_addon:triggerClientCallback', scr, name, otp, ...)
end

RegisterNetEvent('dream_addon:clientCallback')
AddEventHandler('dream_addon:clientCallback', function(name, otp, ...)
	for i,v in ipairs(clientCallbacks) do
		if v.name == name and v.otp == otp then
			v.cb(...)
			table.remove(clientCallbacks, i)
			break
		end
	end
end)

function getRandomString(size)
	if size == nil then
		size = 100
	end
	local string = ""
	for i=1,size do
		string = string .. chars[math.random(1,#chars)]
	end
	return string
end

-- Example
--[[ Change from --[[ to ---[[
Citizen.CreateThread(function()
	Citizen.Wait(1000)
	print("Send callback request")
	DreamAddon.TriggerClientCallback('dream_addon:debug',1,function(result)
		print("Callback received (" .. result .. ")")
	end, "args to client")
end)
--]]
