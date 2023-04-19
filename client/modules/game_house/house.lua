-----------------------------------------------------------------------------
--------------------- [OTCLIENT-MODULE] House Look Module -------------------
----------------------------- AUTHOR: Michyaraque ---------------------------
--------------------------------- 21/06/2020 --------------------------------
-----------------------------------------------------------------------------

config = {
  OPCODE_HOUSE = {199},
}

function init()
  lookWindow = g_ui.displayUI('house')
  lookWindow:hide()

  ProtocolGame.registerExtendedOpcode(config.OPCODE_HOUSE[1], function(protocol, opcode, buffer) house(protocol, opcode, buffer) end)

  connect(g_game, {
	onGameStart = nothing,
    onGameEnd = offline
  })

end

function house(protocol, opcode, buffer)
  if opcode == config.OPCODE_HOUSE[1] then
    house_data = buffer:explode("|")
    house_ = {}
    house_.mapname = house_data[2]
    house_.owner = house_data[3]
    house_.town = house_data[4]
    house_.size = house_data[5]
    house_.price = house_data[6]
    getHouseInformation()
  end
end


function getHouseInformation()
  lookWindow:show()
  lookWindow:raise()
  lookWindow:focus()

  if not g_game.isOnline() then
    protocol:disconnect()
    return
  end

  local house_information = lookWindow:getChildById('full_content'):getChildById('right_content'):getChildById('data_content'):getChildById('info_panel')
  lookWindow:getChildById('full_content'):getChildById('right_content'):getChildById('house_map_name'):setText(tr(house_.mapname))
  house_information:getChildById('house_owner'):setText(tr("Owner: "..house_.owner))
  house_information:getChildById('town_name'):setText(tr("Town: "..house_.town))
  house_information:getChildById('house_size'):setText(tr("Size: "..house_.size.." squares"))
  house_information:getChildById('house_price'):setText(tr("Price: "..house_.price.." dollars"))

  if house_data[3] == "Nobody" then
    lookWindow:getChildById('full_content'):getChildById('right_content'):getChildById('buyhousebutton'):setVisible(true)
    lookWindow:getChildById('full_content'):getChildById('left_image'):setImageSource('/images/game/house/not_ocupped')
  else
    lookWindow:getChildById('full_content'):getChildById('right_content'):getChildById('buyhousebutton'):setVisible(false)
    lookWindow:getChildById('full_content'):getChildById('left_image'):setTooltip(house_.owner.." owns this house")
    lookWindow:getChildById('full_content'):getChildById('left_image'):setImageSource('/images/game/house/ocupped')
  end
end

function terminate()
  disconnect(g_game, {
    onGameStart = refresh,
    onGameEnd = offline
  })
  lookWindow:hide()
  ProtocolGame.unregisterExtendedOpcode(config.OPCODE_HOUSE[1])
end

function offline()
  lookWindow:hide()
end

function toggle()
  if lookWindow:isVisible() then
    onCloseInformation()
  else
    getHouseInformation()
  end
end

function sendBuyHouse()
  g_game.talk("!buyhouse")
  if lookWindow:isVisible() then
    onCloseInformation()
  end
end


function onCloseInformation()
  lookWindow:hide()

  if acceptWindow then
    acceptWindow:destroy()
	acceptWindow = nil
  end
end
