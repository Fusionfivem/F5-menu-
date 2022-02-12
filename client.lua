local amountspawned = 0
local players = GetNumberOfPlayers()
gambled = false

RegisterNetEvent('setgambled:true')
AddEventHandler('setgambled:true', function()
	gambled = true
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(Config.GambleCooldown * 60000)
		gambled = 0
	end
end)

Citizen.CreateThread(function()
	while CYCLONE == nil do
		TriggerEvent(Config.SharedObject, function(obj) CYCLONE = obj end)
		Citizen.Wait(4)
	end
end)

local menu = MenuV:CreateMenu(false, 'Fusion\'s F5 Menu', 'centerright', 255, 0, 0, 'size-150', 'example', 'menuv', 'example_namespace')

local menu2 = MenuV:CreateMenu(false, 'Report Menu', 'centerright', 255, 0, 0, 'size-150', 'example', 'menuv', false)

local menu3 = MenuV:CreateMenu(false, 'All Menu\'s', 'centerright', 255, 0, 0, 'size-150', 'example', 'menuv', false)

local menu4 = MenuV:CreateMenu(false, 'Miscellaneous', 'centerright', 255, 0, 0, 'size-150', 'example', 'menuv', false)

local menu5 = MenuV:CreateMenu(false, 'World Options', 'centerright', 255, 0, 0, 'size-150', 'example', 'menuv', false)

local menu6 = MenuV:CreateMenu(false, 'Discord Chat Tags', 'centerright', 255, 0, 0, 'size-150', 'example', 'menuv', false)

-- MENU 1 BUTTONS / MAIN MENU
local menu_button10 = menu:AddButton({ icon = '🚩', label = 'Report Menu', value = menu2, description = 'Make preset report\'s so admin\'s respond faster!' })

local menu_button11 = menu:AddButton({ icon = '🪣', label = 'All Menu\'s', value = menu3, description = 'All menus available to open!' })

local menu_button13 = menu:AddButton({ icon = '🌏', label = 'World Options', value = menu5, description = 'All World Options' })

local menu_button14 = menu:AddButton({ icon = '💬', label = 'Discord Chat Tags', value = menu6, description = 'Rotate through your chat tags!' })

local menu_button12 = menu:AddButton({ icon = '🫓', label = 'Miscellaneous', value = menu4, description = 'All Miscellaneous Options' })

local menu_button2 = menu3:AddButton({ icon = '❌', label = 'Open Crosshair Menu', value = false, description = 'Open\'s the Crosshair UI'})

local menu_button3 = menu3:AddButton({ icon = '📈', label = 'Open Gang Leaderboard', value = false, description = 'Open\'s the Gang Leaderboard'})

local menu_button4 = menu4:AddButton({ icon = '🚗', label = 'Spawn Golf Cart', value = false, description = 'Spawns a Golf Cart'})

local menu_button5 = menu4:AddButton({ icon = '🎲', label = 'Gamble', value = false, description = 'Gamble with yourself. $100,000'})

local menu_button6 = menu4:AddButton({ icon = '🚑', label = 'Respawn Glitch', value = false, description = 'Force respawns your player'})

local checkbox = menu4:AddCheckbox({ icon = '🗺️', label = 'Disable Minimap', value = false, description = 'Disables the minimap'})

local checkbox2 = menu4:AddCheckbox({ icon = '️🕺', label = 'Hide ID', value = false, description = 'Disables the bottom-right ID/Discord'})

RegisterNetEvent('receiverolelist')
AddEventHandler('receiverolelist', function(roles, accessChat)
	roles = discordroles
	
	accesschat = chataccess
	print(discordroles)
end)



-- MENU 2 BUTTONS / REPORT MENU
local menu2_button = menu2:AddButton({ icon = '☠️', label = 'RDM', value = false, description = 'Report a Random Deathmatch' })
local menu2_button2 = menu2:AddButton({ icon = '🏎️', label = 'VDM', value = false, description = 'Report a Vehicle Deathmatch' })
local menu2_button3 = menu2:AddButton({ icon = '🏫', label = 'Stuck', value = false, description = 'Stuck under map' })
local menu2_button4 = menu2:AddButton({ icon = '💻', label = 'Modder', value = false, description = 'Report a modder' })

menu2_button:On("select", function(item, value)
    ExecuteCommand('report RDM | Report made using F5 Menu')
end)
menu2_button2:On("select", function(item, value)
    ExecuteCommand('report VDM | Report made using F5 Menu')
end)
menu2_button3:On("select", function(item, value)
    ExecuteCommand('report Stuck | Report made using F5 Menu')
end)
menu2_button4:On("select", function(item, value)
   TriggerServerEvent('ij123oas9disoak')
end)


checkbox:On('check', function(item)
    DisplayRadar(false)
end)

checkbox:On('uncheck', function(item)
    DisplayRadar(true)
end)


-- TIME
local slider = menu5:AddSlider({ icon = '🕑', label = 'Time', value = 'time', description = 'Change the time', values = {
    { label = 'Sunrise', value = 'sunrise', description = 'Sunrise' },
    { label = 'Afternoon', value = 'afternoon', description = 'Afternoon' },
    { label = 'Sunset', value = 'sunset', description = 'Sunset' },
    { label = 'Night', value = 'night', description = 'Night' }
}})


slider:On('select', function(item, value) 
	if value == "sunrise" then
	print ('sunrise')
	NetworkOverrideClockTime(5, 45, 0)
	elseif value == "afternoon" then
	print('afternoon')
	NetworkOverrideClockTime(13, 0, 0)
	elseif value == "sunset" then
	print('sunset')
	NetworkOverrideClockTime(19, 0, 0)
	elseif value == "night" then
	print("night")
	NetworkOverrideClockTime(22, 0, 0)
	end
end)

-- WEATHER
local slider2 = menu5:AddSlider({ icon = '☁️', label = 'Weather', value = 'weather', description = 'Change the weather', values = {
    { label = 'Rain', value = 'rain', description = 'Rain' },
    { label = 'Sunshine', value = 'sunshine', description = 'Sunshine' },
    { label = 'Clear', value = 'clear', description = 'Clear' },
    { label = 'Thunder', value = 'thunder', description = 'Thunder' }
}})

slider2:On('select', function(item, value) 
	if value == "rain" then
	print ('rain')
	SetWeather('RAIN')
	elseif value == "sunshine" then
	print('sunshine')
	SetWeather('EXTRASUNNY')
	elseif value == "clear" then
	SetWeather('CLEAR')
	print('clear')
	elseif value == "thunder" then
	print('thunder')
	SetWeather('THUNDER')
	end
end)


local menu_button = menu:AddButton({ icon = '🔧', label = 'Made By Fusion', value = false, description = 'Fusion#1234'})

function SetWeather(weathertype)
	ClearOverrideWeather()
    ClearWeatherTypePersist()
    SetWeatherTypePersist(weathertype)
    SetWeatherTypeNow(weathertype)
    SetWeatherTypeNowPersist(weathertype)
end

--COMMAND BUTTONS
menu_button2:On("select", function(item, value)
    ExecuteCommand('crosshair')
end)

menu_button3:On("select", function(item, value)
    ExecuteCommand('lb')
end)


-- SPAWN GOLF CART
menu_button4:On("select", function(item, value)
    if amountspawned == 1 then
		PlaySoundFrontend(-1, 'LOSER', 'HUD_AWARDS', false)
		CYCLONE.Scaleform.ShowFreemodeMessage('~r~You have spawned in a golf kart recently', '~y~Please wait 5 minutes before spawning in another golf kart!', 10)
	else
		amountspawned = 1
		

		print('spawned car')
		spawnVehicle('caddy')
		Wait(200)
		
		local Veh = GetVehiclePedIsIn(GetPlayerPed(-1))
		local color = 255, 0, 0
		SetVehicleCustomPrimaryColour(Veh, color)
	end
end)

function spawnVehicle(model)
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)
	CYCLONE.Game.SpawnVehicle(model, coords, 90.0, function(vehicle)
		TaskWarpPedIntoVehicle(playerPed,  vehicle, -1)
	end)
end

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(Config.CarCooldown * 60000)
		amountspawned = 0
	end
end)


menu_button5:On("select", function(item, value)
	if gambled then
		CYCLONE.ShowNotification(Config.GambleCooldownMessage)
	else
		TriggerServerEvent('asd123sadsdaggg')

	end
end)



-- FIX RESPAWN GLITCH
menu_button6:On("select", function(item, value)


	local ped = PlayerPedId()
	if GetEntityHealth(ped) <= 0 then
    SetEntityCoordsNoOffset(ped, -12.07, -1830.12, 25.4, false, false, false, true)
    NetworkResurrectLocalPlayer(-12.07, -1830.12, 25.4, 141.39, true, false)
    TriggerEvent("playerSpawned",  -12.07, -1830.12, 25.4)
	StopScreenEffect("DeathFailOut")
	ClearPedBloodDamage(ped)
    CYCLONE.UI.Menu.CloseAll()
	
	Wait(5)
	SetEntityCoords(PlayerPedId(),-12.07, -1830.12, 25.4, false, false, false, false)
	TriggerServerEvent('aasj123jsxX')
	else
	PlaySoundFrontend(-1, 'LOSER', 'HUD_AWARDS', false)
	CYCLONE.Scaleform.ShowFreemodeMessage('~r~You are not dead!', '~y~You have to be dead in order to revive!', 5)
	end
end)

menu:OpenWith('KEYBOARD', 'F5') -- Press F1 to open Menu
