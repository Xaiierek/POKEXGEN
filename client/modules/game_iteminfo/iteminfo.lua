itemLookWindow = nil
fadeOutEvent = nil

function init()
  itemLookWindow = g_ui.displayUI('iteminfo')
  itemLookWindow:hide()

    ProtocolGame.registerExtendedOpcode(201, function(protocol, opcode, buffer) displayItemInformation(protocol, opcode, buffer) end)


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


  if itemLookWindow then
    itemLookWindow:destroy()
    itemLookWindow = nil
  end


  ProtocolGame.unregisterExtendedOpcode(201)
end

function online()
  if not g_ui.isLoaded() then
    return
  end

  if not itemLookWindow then
    itemLookWindow = g_ui.displayUI('iteminfo')
    itemLookWindow:hide()
  end
end

function offline()
  if itemLookWindow then
    itemLookWindow:hide()
  end
end

function onPlayerPositionChange(player, newPos, oldPos)
  if itemLookWindow:isVisible() then
    itemLookWindow:hide()
  end
end

function onCloseItemInformation()
  itemLookWindow:hide()
end

function displayItemInformation(protocol, opcode, buffer)



    local json_status, json_data =
        pcall(
        function()
            return json.decode(buffer)
        end
    )

    if not json_status then
        g_logger.error("[My Module] JSON error: " .. json_data)
        return false
    end

    local clientId = json_data.item_info
    local itemName = json_data.item_name
    local containerContents = json_data.contents or {}

    getItemInformation(clientId, itemName, containerContents)
end


function Player:getItemsCount(itemId)
  local items, count = self:getItems(itemId), 0
  for i=1,#items do
    count = count + items[i]:getCount()
  end
  return count
end

function getItemCount(itemId)
    local player = g_game.getLocalPlayer()
    if not player then return 0 end

    return player:getItemsCount(itemId)
end


function getItemInformation(clientId, itemName, containerContents)
  if not itemLookWindow:isVisible() then
    fadeInWindow(itemLookWindow)
  end

  local centerPanel = itemLookWindow:getChildById('full_content'):getChildById('info_panel')
  local imagePanel = itemLookWindow:getChildById('full_content'):getChildById('center_panel'):getChildById('imagePanel')

  local count = getItemCount(clientId)

  centerPanel:getChildById('item_name'):setText(tr(itemName))
  imagePanel:setItemId(clientId)
  imagePanel:setItemCount(count)

  local contentArea = itemLookWindow:getChildById('full_content'):getChildById('info_panel'):getChildById('item_contents')
  contentArea:destroyChildren()

  for _, item in ipairs(containerContents) do
    local uiItem = g_ui.createWidget('UIItem', contentArea)
    uiItem:setItemId(item.id)
    -- Tutaj można również zliczyć ilość danego przedmiotu w kontenerze
    local containerItemCount = getItemCount(item.id)
    uiItem:setItemCount(containerItemCount)
  end
end

function fadeInWindow(window)
  g_effects.fadeIn(window, 100)
  itemLookWindow:show()
end

function fadeOutWindow(window)
  g_effects.fadeOut(window, 200)
	itemLookWindow:hide()
end