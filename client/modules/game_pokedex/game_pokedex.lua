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
function string:split(delimiter)
    local result = {}
    local from = 1
    local delim_from, delim_to = string.find(self, delimiter, from)
    while delim_from do
        table.insert(result, string.sub(self, from, delim_from - 1))
        from = delim_to + 1
        delim_from, delim_to = string.find(self, delimiter, from)
    end
    table.insert(result, string.sub(self, from))
    return result
end

function pokedex(protocol, opcode, buffer)
  if opcode == config.OPCODE_DEX[1] then
    local dex_data = buffer:explode("|")
    dex_ = {}
    dex_.monsterType = dex_data[2]
	dex_.getRaceName = dex_data[3]
	dex_.getRace2Name = dex_data[4]
	    dex_.getMoveList = {}
    local moveListStr = dex_data[5]
    local moveStrList = moveListStr:split(";")
    for i = 1, #moveStrList do
        local moveStr = moveStrList[i]
        local moveData = moveStr:split(":")
        local move = {name = moveData[1], speed = tonumber(moveData[2]) * 1000}
        table.insert(dex_.getMoveList, move)
    end
    
    print("dex_data:")
    for i, v in ipairs(dex_data) do
      print(i, v)
    end
    print("Monster type: " .. dex_.monsterType)
	print("Race: " .. dex_.getRaceName)
	print("Race2: " .. dex_.getRace2Name)
	
    
	
	setPokemonTypeImage(dex_.getRaceName)
	setType2(dex_.getRace2Name)
    setPokemonImage(dex_.monsterType)
    getPokedexInformation()
  end
end

------------------------------------------------------
-----------------------RACE---------------------------
------------------------------------------------------

function setPokemonTypeImage(typeName)
	local monsterTypePanel = pokedexWindow:recursiveGetChildById('type_label')
		monsterTypePanel.onMouseHoverChange = function(self, hover)
		if hover then
			local tooltip = g_ui.createWidget('Tooltip')
			tooltip:setId('typeTooltip')
			tooltip:setText(tr(typeName) .. " type")
			self:setTooltipWidget(tooltip)
		else
			self:removeTooltipWidget()
		end
	end



function moveListToString(moveList)
    local moveListText = ""

    if #moveList >= 1 then
        for i = 1, #moveList do
            local move = moveList[i]
            if move then
                moveListText = moveListText .. string.format("\n - %s. Cooldown: %.2f seconds.", move.name, move.speed / 1000)
            else
                break
            end
        end
    end

    return moveListText
end






  local typeImagePath = 'images/types/' .. typeName .. '.png'
  if g_resources.fileExists(typeImagePath) then
    print("Type image path: " .. typeImagePath)
    local monsterTypePanel = pokedexWindow:recursiveGetChildById('type_label')
    monsterTypePanel:setImageSource(typeImagePath)
  else
    print("Type image not found for: " .. typeName)
  end
end

------------------------------------------------------
-----------------------RACE2---------------------------
------------------------------------------------------
function setType2(typeName2)
	local typePanel2 = pokedexWindow:recursiveGetChildById('type_label2')
	typePanel2.onMouseHoverChange = function(self, hover)
		if hover then
			local tooltip = g_ui.createWidget('Tooltip')
			tooltip:setId('typeTooltip')
			tooltip:setText(tr(typeName2) .. " type")
			self:setTooltipWidget(tooltip)
		else
			self:removeTooltipWidget()
		end
	end
	
  local typeImagePath2 = 'images/types/' .. typeName2 .. '.png'
  if g_resources.fileExists(typeImagePath2) then
    print("Type image path: " .. typeImagePath2)
    local typePanel2 = pokedexWindow:recursiveGetChildById('type_label2')
    typePanel2:setImageSource(typeImagePath2)
  else
    print("Type image not found for: " .. typeName2)
  end
end

function setPokemonImage(imageName)
  local imagePath = 'images/pokemon_image/' .. imageName .. '.png'
  -- Dodajemy linijkę poniżej, aby sprawdzić ścieżkę obrazu
  print("Image path: " .. imagePath)
  
  local imagePanel = pokedexWindow:recursiveGetChildById('pokemon_image')
  
  if g_resources.fileExists(imagePath) then
    imagePanel:setImageSource(imagePath)
  else
    imagePanel:setImageSource('')
  end
end


function getPokedexInformation()
  pokedexWindow:show()
  pokedexWindow:raise()
  pokedexWindow:focus()

  local pokemon_label = pokedexWindow:recursiveGetChildById('pokemon_label')
  local type_label = pokedexWindow:recursiveGetChildById('type_label')
  local type_label2 = pokedexWindow:recursiveGetChildById('type_label2')
  local movelist_label = pokedexWindow:recursiveGetChildById('movelist_label')

  if pokemon_label then
    pokemon_label:setText(dex_.monsterType)
    setPokemonImage(dex_.monsterType)
  end
  if type_label then
    setPokemonTypeImage(dex_.getRaceName)
  end
	if type_label2 then
		setType2(dex_.getRace2Name)
  end
    if movelist_label then
        movelist_label:setText(moveListToString(dex_.getMoveList))
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
