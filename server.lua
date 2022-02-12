roleList = {
		{597446537999810573, "^2Member | "}, -- 1
		{'Server Booster', "^6Server Booster | "}, -- 2
		{597449475547463681, "^4Developer | "}, -- 3
		{'Customer', "^3Customer | "}, -- 4
		{597447226997866536, "^5Supporter | "}, -- 5
		{'Staff', "^1Staff | "}, -- 6
		{926684591224414208, "^8Admin | "}, -- 7
		{925653102911176724, "^8Founder | "}, -- 8
}

TriggerEvent(Config.SharedObject, function(obj) Config.FrameworkName = obj end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(Config.GambleCooldown * 60000)
		gambled = 0
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(Config.ModderReportCooldown * 60000)
	end
end)

RegisterServerEvent('asd123sadsdaggg')
AddEventHandler('asd123sadsdaggg', function(amount)
	local _source = source
    local xPlayer = Config.FrameworkName.GetPlayerFromId(_source)
	
	local money = xPlayer.getMoney()
	TriggerClientEvent("setgambled:true")
	earnings = math.random(1, 250000)
	
	if earnings > 250000 then
		DropPlayer(source, 'no way you tried exploiting big daddy sizzle\'s script smh. 🤡')
	end
		
	if not amount == nil then
		DropPlayer(source, 'you actually fucking tried you shitter. 🤡')
	end
	
	
	if money >= 100000 then
		local earnings = math.random(1, 250000)
		
		xPlayer.removeMoney(100000)
		
		xPlayer.showNotification(Config.RandomizingNumberMessage)
		Wait(2000)
		xPlayer.showNotification('You have one ' .. earnings ..  '! \n' .. Config.AmountWonMessage)
		xPlayer.addMoney(earnings)
		else
			xPlayer.showNotification(Config.NotEnoughMoneyMessage)
		end
end)

RegisterServerEvent('ij123oas9disoak')
AddEventHandler('ij123oas9disoak', function()
print('modder reported')
		TriggerEvent("es:getPlayers", function(pl)
			for k,v in pairs(pl) do
				TriggerEvent("es:getPlayerFromId", k, function(user)
					if(user.getPermissions() > 0)then
					
						print('modder reported')
						TriggerClientEvent('chat:addMessage', k, {
							template = '<div style="padding: 0.6vw; margin: 0.6vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 3px;"><i class="fas fa-user-shield"></i> {0}: {1}</div>', args = {"31F5 Modder Report", " ^0(^2" .. GetPlayerName(source) .. " | " .. source .. "^0) MODDER REPORTED GET THERE NOW!!!"}
						})
						print('modder reported')
						TriggerClientEvent('chat:addMessage', k, {
							template = '<div style="padding: 0.6vw; margin: 0.6vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 3px;"><i class="fas fa-user-shield"></i> {0}: {1}</div>', args = {"^3F5 Modder Report", " ^0(^2" .. GetPlayerName(source) .. " | " .. source .. "^0) MODDER REPORTED GET THERE NOW!!!"}
						})
						print('modder reported')
						TriggerClientEvent('chat:addMessage', k, {
							template = '<div style="padding: 0.6vw; margin: 0.6vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 3px;"><i class="fas fa-user-shield"></i> {0}: {1}</div>', args = {"^3F5 Modder Report", " ^0(^2" .. GetPlayerName(source) .. " | " .. source .. "^0) MODDER REPORTED GET THERE NOW!!!"}
						})
						print('modder reported')
						TriggerClientEvent('chat:addMessage', k, {
							template = '<div style="padding: 0.6vw; margin: 0.6vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 3px;"><i class="fas fa-user-shield"></i> {0}: {1}</div>', args = {"^3F5 Modder Report", " ^0(^2" .. GetPlayerName(source) .. " | " .. source .. "^0) MODDER REPORTED GET THERE NOW!!!"}
						})
						print('modder reported')
						TriggerClientEvent('chat:addMessage', k, {
							template = '<div style="padding: 0.6vw; margin: 0.6vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 3px;"><i class="fas fa-user-shield"></i> {0}: {1}</div>', args = {"^3F5 Modder Report", " ^0(^2" .. GetPlayerName(source) .. " | " .. source .. "^0) MODDER REPORTED GET THERE NOW!!!"}
						})
					end
				end)
			end
		end)
end)

RegisterServerEvent('aasj123jsxX')
AddEventHandler('aasj123jsxX', function()
	local _source = source
    local xPlayer = Config.FrameworkName.GetPlayerFromId(_source)
	
	xPlayer.removeMoney(Config.RespawnPrice)
	
	for i=#xPlayer.loadout, 1, -1 do
		xPlayer.removeWeapon(xPlayer.loadout[i].name)
	end
end)
