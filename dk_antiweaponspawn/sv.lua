webhook = "XXXX"
RegisterNetEvent('SV_DETECTION')
AddEventHandler('SV_DETECTION', function(wh)
	local _source = source
    local nombresteam = GetPlayerName(_source)
    local texto = "Se ha detectado un "..wh.." en tu inventario que no corresponde con la base de datos, abre ticket"
    sendToDiscord(webhook, "Al usuario: ("..nombresteam.."). Se le ha detectado un "..wh.." en tu inventario que no corresponde con la base de datos.")

    DropPlayer(_source, texto)

end)

function sendToDiscord(canal,message)
	local DiscordWebHook = canal
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
end