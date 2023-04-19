local areas = {
  {
    from = {x = 1036, y = 1048, z = 7},
    to = {x = 1038, y = 1048, z = 7},
    name = "First Area"
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
 local currentArea = ""

 local window = nil 
 local nameLabel = nil
 local fadeOutEvent = nil

function init()
  connect(
    g_game,
    {
      onGameStart = create,
      onGameEnd = destroy
    }
  )

  if g_game.isOnline() then
    create()
  end
end

function create()
  window = g_ui.loadUI("areas", modules.game_interface.getMapPanel())
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

local function fadeOut()
  g_effects.fadeOut(window, 750)
  fadeOutEvent = nil
end

function onPositionChange(player, newPos, oldPos)
  for i = 1, #areas do
    local area = areas[i]
    if currentArea ~= area.name then
      if isInArea(newPos, area.from, area.to) then
        currentArea = area.name
        nameLabel:setText("Entering " .. area.name)
        window:setWidth(nameLabel:getText():len() * 8)
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
  disconnect(
    g_game,
    {
     onGameStart = create,
     onGameEnd = destroy
    }
  )
  if window then
    destroy()
  end
end

function destroy()
  disconnect(LocalPlayer, {onPositionChange = onPositionChange})

  if window then
    window:destroy()
    window = nil
  end

  nameLabel = nil
  fadeOutEvent = nil
  currentArea = ""
end
