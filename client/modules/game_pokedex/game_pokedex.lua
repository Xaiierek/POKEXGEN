-----------------------------------------------------------------------------
--------------------- [OTCLIENT-MODULE] House Look Module -------------------
----------------------------- AUTHOR: Michyaraque ---------------------------
--------------------------------- 21/06/2020 --------------------------------
-----------------------------------------------------------------------------

config = {
  OPCODE_DEX = {198},
}

function init()
  pokedexWindow = g_ui.displayUI('game_pokedex')
  pokedexWindow:hide()

  ProtocolGame.registerExtendedOpcode(config.OPCODE_DEX[1], function(protocol, opcode, buffer) pokedex(protocol, opcode, buffer) end)

  connect(g_game, {
	onGameStart = nothing,
    onGameEnd = offline
  })

end

function pokedex(protocol, opcode, buffer)
  if opcode == config.OPCODE_DEX[1] then
    local dex_data = buffer:explode("|")
    dex_ = {}
    dex_.monsterNumber = dex_data[1]
    dex_.portraitId = tonumber(dex_data[3])
    dex_.portraitItemType = dex_data[3]
    dex_.summonStatus = table.concat(dex_data, "|", 4) -- Przechwytuje wszystkie informacje o pokemonie
    dex_.summonStatus = dex_data[5]

	--print("dex_data:")
	--for i, v in ipairs(dex_data) do
	--	print(i, v)
	--end
   -- print("Monster type: " .. dex_.monsterNumber)
   -- print("Portrait ID: " .. dex_.portraitId)
   -- print("Portrait item type: " .. dex_.portraitItemType)
   -- print("Summon Status: " .. dex_.summonStatus)

    getPokedexInformation()
  end
end


function getPokedexInformation()
  pokedexWindow:show()
  pokedexWindow:raise()
  pokedexWindow:focus()

  local monsterTypeLabel = pokedexWindow:recursiveGetChildById('monster_type_label')
  local portraitIdLabel = pokedexWindow:recursiveGetChildById('portrait_id_label')
  local portraitItemTypeLabel = pokedexWindow:recursiveGetChildById('portrait_item_type_label')
  local summonStatusLabel = pokedexWindow:recursiveGetChildById('summon_status_label') -- Upewnij się, że istnieje ten element w oknie pokedexWindow w pliku XML

	if summonStatusLabel then
	summonStatusLabel:setText(dex_.summonStatus)
	end



  if monsterTypeLabel and portraitIdLabel and portraitItemTypeLabel and summonStatusLabel then
    monsterTypeLabel:setText("Monster Type: " .. dex_.monsterNumber)
    portraitIdLabel:setText("Portrait ID: " .. tostring(dex_.portraitId))
    portraitItemTypeLabel:setText("Portrait Item Type: " .. tostring(dex_.portraitItemType))
    summonStatusLabel:setText(dex_.summonStatus) -- Dodaje status pokemona do interfejsu użytkownika
  end
end

function terminate()
  disconnect(g_game, {
    onGameStart = refresh,
    onGameEnd = offline
  })
  pokedexWindow:hide()
  ProtocolGame.unregisterExtendedOpcode(config.OPCODE_DEX[1])
end

function offline()
  pokedexWindow:hide()
end

function toggle()
  if pokedexWindow:isVisible() then
    onCloseInformation()
  else
    getPokedexInformation()
  end
end


function onCloseInformation()
  pokedexWindow:hide()
end
