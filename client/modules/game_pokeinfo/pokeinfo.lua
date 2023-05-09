pokemonLookWindow = nil

function init()
  pokemonLookWindow = g_ui.displayUI('pokeinfo')
  if not pokemonLookWindow then
    print("Error: Failed to load pokeinfo.otui")
    return
  end

  print("pokeinfo.otui loaded successfully")
  pokemonLookWindow:hide()

  ProtocolGame.registerExtendedOpcode(200, function(protocol, opcode, buffer) displayPokemonInformation(protocol, opcode, buffer) end)

  connect(g_game, {
    onGameStart = nothing,
    onGameEnd = offline
  })
end

function terminate()
  disconnect(g_game, {
    onGameStart = online,
    onGameEnd = offline
  })

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

function onClosePokemonInformation()
  pokemonLookWindow:hide()
end

function displayPokemonInformation(protocol, opcode, buffer)
  print("OTCv8 received opcode:", opcode)
  print("OTCv8 received buffer:", buffer)

  local pokemonData = buffer:explode("|")
  local name = pokemonData[2]
  local level = tonumber(pokemonData[3])
  local boost = tonumber(pokemonData[4])

  getPokemonInformation(name, level, boost)
end

function getPokemonInformation(name, level, boost)
  pokemonLookWindow:show()
  pokemonLookWindow:raise()
  pokemonLookWindow:focus()

  local infoPanel = pokemonLookWindow:getChildById('full_content'):getChildById('right_content')


  --infoPanel:getChildById('poke'):setItemId(Item.create(clientId, count))
  infoPanel:getChildById('pokemon_name'):setText(tr(name))
  infoPanel:getChildById('pokemon_level'):setText(tr("Level: " .. level))

  if boost and boost > 0 then
    infoPanel:getChildById('pokemon_boost'):setText(tr("Boost: " .. boost))
  else
    infoPanel:getChildById('pokemon_boost'):setText(tr("Boost: None"))
  end
end
