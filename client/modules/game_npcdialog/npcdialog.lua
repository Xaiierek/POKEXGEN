local npcWindowDialog 
local buttonHolder
local lblTitle
local outfitBox
local panelMsg
local scrollPanel
local lblMessage
local itemBox
local promise
local buttondialog
local fadeOutEvent = nil
local initialHeight = 200  -- Wartość startowa do ustalenia

function init()
  connect(g_game, { onGameEnd = offline })
  connect(LocalPlayer, { onPositionChange = onCreaturePositionChange })
	
  ProtocolGame.registerExtendedOpcode(80, function(protocol, opcode, buffer)
    print("Received extended opcode data: " .. buffer) 
    local data = json.decode(buffer)
    if (data.action == "close") then
      offline()
    elseif (data.action == "create") then
      NpcDialog(data.data)
    end
  end)
	
  npcWindowDialog = g_ui.displayUI('npcdialog')
	
  buttonHolder = npcWindowDialog:getChildById('buttonHolder')
  lblTitle     = npcWindowDialog:getChildById('lblTitle')
  scrollPanel  = npcWindowDialog:getChildById('scrollPanel')
  panelMsg     = npcWindowDialog:getChildById('panelMsg')
  outfitBox    = npcWindowDialog:getChildById('outfitBox')
  itemBox      = npcWindowDialog:getChildById('itemBox')
  buttondialog      = npcWindowDialog:getChildById('buttondialog')
  lblMessage   = g_ui.createWidget('LabelText', panelMsg)
end

function terminate()
  disconnect(g_game, { onGameEnd = offline })
  disconnect(Creature, {	onPositionChange = onCreaturePositionChange })
  ProtocolGame.unregisterExtendedOpcode(80)
  removeEvent(npcWindowDialog.fadeEvent)
  npcWindowDialog:destroy()
end


function clearItemBox()
  itemBox:destroyChildren()
end

function offline()
  clearItemBox()
  buttondialog:destroyChildren()
  npcWindowDialog:hide()
  npcWindowDialog:setHeight(initialHeight)
  if fadeOutEvent then
    removeEvent(fadeOutEvent)
  end
end



function onCreaturePositionChange(creature, newPos, oldPos)
  if creature:isLocalPlayer() then
    clearItemBox()
	npcWindowDialog:setHeight(initialHeight)
    npcWindowDialog:hide()

  end
end

function openDialog()
  npcWindowDialog:raise()
  npcWindowDialog:show()
  npcWindowDialog:setOpacity(0)
  npcWindowDialog:setHeight(initialHeight)
  g_effects.fadeIn(npcWindowDialog, 150)
  if fadeOutEvent then
    removeEvent(fadeOutEvent)
  end
  fadeOutEvent = scheduleEvent(function() g_effects.fadeOut(npcWindowDialog, 150) end, 30000)
end

function writeTextEffect(lblMessage, text, delay, callback)
  lblMessage:clearText() 
  local textSize = #text 

  -- Zainicjowanie wartości wysokości
  local initialHeight = npcWindowDialog:getHeight()
  
  for i = 1, textSize do
    scheduleEvent(function() 
      lblMessage:setText(lblMessage:getText() .. text:sub(i, i))

      -- Oblicz nową wysokość na podstawie długości tekstu
      local newHeight = initialHeight + lblMessage:getTextSize().height 

      -- Aktualizuj wysokość okna dialogowego
      npcWindowDialog:setHeight(newHeight)
      
      -- Wywołaj funkcję zwrotną, gdy cały tekst zostanie napisany
      if i == textSize then
        callback()
      end
    end, delay * i)
  end
end



function writeTextEffect(lblMessage, text, delay, callback)
  lblMessage:clearText() 
  local textSize = #text 

  -- Zainicjowanie wartości wysokości
  local initialHeight = npcWindowDialog:getHeight()
  
  for i = 1, textSize do
    scheduleEvent(function() 
      lblMessage:setText(lblMessage:getText() .. text:sub(i, i))

      -- Oblicz nową wysokość na podstawie długości tekstu
      local newHeight = initialHeight + lblMessage:getTextSize().height 

      -- Aktualizuj wysokość okna dialogowego
      npcWindowDialog:setHeight(newHeight)
      
      -- Wywołaj funkcję zwrotną, gdy cały tekst zostanie napisany
      if i == textSize then
        callback()
      end
    end, delay * i)
  end
end

-- A potem w NpcDialog:

function NpcDialog(value)
  clearItemBox()
  local Npc = g_map.getCreatureById(value.npcId)
  
  lblTitle:setText(Npc:getName())
  outfitBox:setOutfit(Npc:getOutfit())
  itemBox:setItemId(clientId)
  
  lblMessage:clearText()
  writeTextEffect(lblMessage, tr(value.message), 15)
  scrollPanel:setVisible(lblMessage:getTextSize().height > panelMsg.limitText)
  
  local textLength = string.len(value.message)
  local windowHeight = textLength * 10 -- Możesz dostosować wartość mnożnika (10), aby uzyskać pożądany rozmiar okna
  
  -- Dodajemy wysokość obszaru z itemami
  if value.items ~= nil then
    local itemHeight = 10 -- Wysokość itemu - dopasuj do własnych potrzeb
    windowHeight = windowHeight + (#value.items * itemHeight)
  end

  -- Maksymalne rozmiary okna
  local maxHeight = 200 -- Dostosuj do swoich potrzeb
  if windowHeight > maxHeight then
    windowHeight = maxHeight
  end

  npcWindowDialog:setHeight(windowHeight) -- Dostosuj wysokość okna

  buttondialog:destroyChildren()  
  if value.options ~= '' then
    local option = value.options:split('&')

    for i = 1, #option do
      local button = g_ui.createWidget('OptionButton', buttondialog)
      button:setText(tr(option[i])) -- użyj tłumaczenia
      button:setWidth(500) 
      button:setHeight(150)
      button:setVisible(false) -- Ustawiamy przyciski jako niewidzialne

      button.onClick = function() 
        g_game.talkChannel(MessageModes.NpcTo, 0, option[i]) 
        npcWindowDialog:setHeight(initialHeight)  -- resetuj wysokość okna po naciśnięciu przycisku
        button:setVisible(false) -- Ukrywamy przycisk po kliknięciu
      end
    end

    buttondialog:setHeight(#option > 25 and 88 or 25)

    scheduleEvent(function() 
      for i, child in ipairs(buttondialog:getChildren()) do
        child:setVisible(true) -- Ustawiamy przyciski jako widoczne
        g_effects.fadeIn(child, 500) -- Dodajemy efekt przejścia fade in trwający 1 sekundę
      end
    end, (#value.message * 8) + 500)  -- opóźnienie jest równe długości wiadomości razy prędkość pisania plus dodatkowy pół sekundy
  end
  
  openDialog()
end





