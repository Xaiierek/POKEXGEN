local areas = {
  {
    from = {x = 1033, y = 1045, z = 7},
    to = {x = 1033, y = 1044, z = 7},

  },
  {
    from = {x = 1014, y = 1016, z = 7},
    to = {x = 1017, y = 1020, z = 7},
    name = "Second Area"
  },
  {
    from = {x = 1018, y = 1016, z = 7},
    to = {x = 1021, y = 1020, z = 7},
    name = "Third Area name but longer"
  },
  {
    from = {x = 1022, y = 1016, z = 7},
    to = {x = 1026, y = 1020, z = 7},
    name = "Fourth Arena name"
  }
}




local protocolGame = g_game.getProtocolGame()
local codeBuffer = 0

local currentArea = ""

local window = nil
local nameLabel = nil
local fadeOutEvent = nil


function init()  
    connect(
    g_game,
    {
	  onPositionChange = create,
      onGameEnd = destroy
    }
  )

 -- if g_game.isOnline() then
 --   create()
 -- end

 --g_keyboard.bindKeyDown('Ctrl+D', toggle)
 --bananaButton = modules.client_topmenu.addLeftGameButton('bananaButton', tr('Banana Clicker'), '/modules/game_banana/images/bananaIcon', toggle)

end



function create()
  window = g_ui.displayUI("banana", modules.game_interface.getMapPanel())
  ProtocolGame.registerExtendedOpcode(14, bananacode)
  window:setOpacity(0)
  nameLabel = window:getChildById("name")

  connect(LocalPlayer, {onPositionChange = onPositionChange})
end



local function isInArea(position, fromPos, toPos)
  local x = position.x
  local y = position.y
  local z = position.z
  if z ~= fromPos.z and z ~= toPos.z then
    return false
  end

  if x >= fromPos.x and x <= toPos.x and y >= fromPos.y and y <= toPos.y then
    return true
  end

  return false
end


function onPositionChange(player, newPos, oldPos)
  for i = 1, #areas do
    local area = areas[i]
    if currentArea ~= area.name then
      if isInArea(newPos, area.from, area.to) then
        currentArea = area.name

        g_effects.fadeIn(window, 750)
        if fadeOutEvent then
          removeEvent(fadeOutEvent)
        end
        fadeOutEvent = scheduleEvent(fadeOut, 3000)
        break
      end
    end
  end
end


function terminate()
  ProtocolGame.unregisterExtendedOpcode(14, bananacode)
  window:destroy()
  --Button:destroy()
end

function toggle()
  if window:isVisible() then
    hide()
  else
    show()
  end
end

function show()
  window:show()
  window:raise()
  window:focus()
  if protocolGame then
    protocolGame:sendExtendedOpcode(14, "getRefresh")
  end   
  sendMyCode("getRefresh")
end

function hide()
  window:hide()
end

-- Protocol things

function sendMyCode(codeBuffer)
  local protocolGame = g_game.getProtocolGame()
  if protocolGame then
    protocolGame:sendExtendedOpcode(14, codeBuffer)
  end
end

function bananacode(protocol, code, buffer)
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

  local BCAmountLabel = window:getChildById('clicksAmount')
  BCAmountLabel:setText(json_data.clicksAmount)
end