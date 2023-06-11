pokemonLookWindow = nil
fadeOutEvent = nil

function init()
  pokemonLookWindow = g_ui.displayUI('pokeinfo')
  pokemonLookWindow:hide()

  ProtocolGame.registerExtendedOpcode(200, function(protocol, opcode, buffer) displayPokemonInformation(protocol, opcode, buffer) end)

  connect(g_game, {
    onGameStart = nothing,
    onGameEnd = offline
  })
  
  
  connect(LocalPlayer, { onPositionChange = onPlayerPositionChange })
end

function terminate()
  disconnect(g_game, {
    onGameStart = online,
    onGameEnd = offline
  })
  
  disconnect(LocalPlayer, { onPositionChange = onPlayerPositionChange })

  if pokemonLookWindow then
    pokemonLookWindow:destroy()
    pokemonLookWindow = nil
  end

  ProtocolGame.unregisterExtendedOpcode(200)
end

function online()
  if not g_ui.isLoaded() then
    return
  end

  if not pokemonLookWindow then
    pokemonLookWindow = g_ui.displayUI('pokeinfo')
    pokemonLookWindow:hide()
  end
end

function offline()
  if pokemonLookWindow then
    pokemonLookWindow:hide()
  end
end

function onPlayerPositionChange(player, newPos, oldPos)
  if pokemonLookWindow:isVisible() then
    if fadeOutEvent then
      removeEvent(fadeOutEvent)
	  g_effects.fadeOut(pokemonLookWindow, 200)
      
    end
	fadeOutEvent = nil
    pokemonLookWindow:hide()
  end
end


function onClosePokemonInformation()
   fadeOutWindow(pokemonLookWindow)

end

function displayPokemonInformation(protocol, opcode, buffer)
  print("OTCv8 received opcode:", opcode)
  print("OTCv8 received buffer:", buffer)

  local pokemonData = buffer:explode("|")
  local name = pokemonData[2]
  local level = tonumber(pokemonData[3])
  local boost = tonumber(pokemonData[4])
  local outfitId = tonumber(pokemonData[5])

  getPokemonInformation(name, level, boost, outfitId)
end

function getPokemonInformation(name, level, boost, outfitId)
  if not pokemonLookWindow:isVisible() then
    fadeInWindow(pokemonLookWindow)
  end

  local infoPanel = pokemonLookWindow:getChildById('full_content'):getChildById('info_panel')
  local imagePanel = pokemonLookWindow:getChildById('full_content'):getChildById('center_panel'):getChildById('imagePanel')
	
	infoPanel:getChildById('pokemon_name'):setText(tr(name))
	infoPanel:getChildById('pokemon_level'):setText(tr("Level: " .. level))

  --print(outfitId)
  --local outfit = {type = 1, head = 0, body = 0, legs = 0, feet = 0, addons = 0}
  --outfit.type = outfitId
  --imagePanel:setOutfit(outfit)
  

  local imagePath = '/data/images/pokemon_image/' .. name .. '.png'
  print("Image path: " .. imagePath)
  if g_resources.fileExists(imagePath) then
    imagePanel:setImageSource(imagePath)
  else
    imagePanel:setImageSource('')
  end
  

  if boost and boost > 0 then
      infoPanel:getChildById('pokemon_boost'):setText(tr("Boost: " .. boost))
  else
      infoPanel:getChildById('pokemon_boost'):setText(tr("Boost: None"))
  end
end

function fadeInWindow(window)
  if window:getOpacity() < 1 then
    window:setOpacity(1)
  end
  g_effects.fadeIn(window, 100)
  pokemonLookWindow:show()
end

function fadeOutWindow(window)
  g_effects.fadeOut(window, 200)
  pokemonLookWindow:hide()
end
