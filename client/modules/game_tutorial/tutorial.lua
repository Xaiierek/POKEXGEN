local tutorialWindow
local tutorialClosed = false

function init()
  connect(
    g_game,
    {
      onGameStart = create,
      onGameEnd = destroy
    }
  )
end

function create()
  connect(LocalPlayer, {onPositionChange = onPositionChange})
end

function terminate()
  disconnect(
    g_game,
    {
      onGameStart = create,
      onGameEnd = destroy
    }
  )
  destroy()
end

function destroy()
  disconnect(LocalPlayer, {onPositionChange = onPositionChange})

  if tutorialWindow then
    tutorialWindow:destroy()
    tutorialWindow = nil
  end
end

function dumpWidgetTree(widget, indent)
  indent = indent or ""
  print(indent .. widget:getId() .. " (" .. widget:getClassName() .. ")")
  for _, child in ipairs(widget:getChildren()) do
    dumpWidgetTree(child, indent .. "  ")
  end
end


function fadeIn(widget, time)
  time = time or 1000
  widget:setOpacity(0)
  g_effects.fadeIn(widget, time)
end

function onPositionChange(localPlayer, newPosition, oldPosition)
   local tutorialPosition = {x = 1033, y = 1045, z = 7}

  if newPosition.x == tutorialPosition.x and newPosition.y == tutorialPosition.y and newPosition.z == tutorialPosition.z then
    if not tutorialWindow then
      tutorialWindow = g_ui.loadUI('tutorial.otui', g_ui.getRootWidget())

      tutorialWindow.onKeyPress = function(widget, keyCode, keyboardModifiers)
        if keyCode == KeyEscape then
          tutorialWindow:hide()
          return true
        end
        return false
      end
    end

    local label = tutorialWindow:getChildById('label')
    label:setText("Witaj w naszym tutorialu! W tym okienku otrzymasz informacje na temat podstaw gry.")
    fadeIn(tutorialWindow)
    tutorialWindow:raise()
    tutorialWindow:focus()
	tutorialWindow:show()
  end
end