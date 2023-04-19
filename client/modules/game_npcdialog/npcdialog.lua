
local npcWindowDialog 
local buttonHolder
local lblTitle
local outfitBox
local panelMsg
local scrollPanel
local lblMessage

function init()
  connect(g_game, { onGameEnd = offline })
  connect(LocalPlayer, { onPositionChange = onCreaturePositionChange })
	
  ProtocolGame.registerExtendedOpcode(80, function(protocol, opcode, buffer)
    local actionAndResult = buffer:explode(">")
	if ( actionAndResult[1] == "close" ) then
	  offline()
	elseif ( actionAndResult[1] == "create" ) then
	  NpcDialog(loadstring("return "..actionAndResult[2])())
	end
  end) 
	
  npcWindowDialog = g_ui.displayUI('npcdialog')
	
  buttonHolder = npcWindowDialog:getChildById('buttonHolder')
  lblTitle     = npcWindowDialog:getChildById('lblTitle')
  scrollPanel  = npcWindowDialog:getChildById('scrollPanel')
  panelMsg     = npcWindowDialog:getChildById('panelMsg')
  outfitBox    = npcWindowDialog:getChildById('outfitBox')
  
  lblMessage   = g_ui.createWidget('LabelText', panelMsg)
end

function terminate()
  disconnect(g_game, { onGameEnd = offline })
  disconnect(Creature, {	onPositionChange = onCreaturePositionChange })
  ProtocolGame.unregisterExtendedOpcode(80)
  removeEvent(npcWindowDialog.fadeEvent)
  npcWindowDialog:destroy()
end

function offline()
  npcWindowDialog:hide()
end

function onCreaturePositionChange(creature, newPos, oldPos)
  if creature:isLocalPlayer() then
	npcWindowDialog:hide()
  end
end

function openDialog()
  npcWindowDialog:raise()
  npcWindowDialog:show()
end

function NpcDialog(value)
  
  local Npc = g_map.getCreatureById(value.npcId)
	
  lblTitle:setText(Npc:getName())
  outfitBox:setOutfit(Npc:getOutfit())
  
  lblMessage:clearText()
  lblMessage:setText(value.message)
  scrollPanel:setVisible(lblMessage:getTextSize().height > panelMsg.limitText)
  
  buttonHolder:destroyChildren()  
  if value.options ~= '' then
    local option = value.options:split('&')
	for i = 1, #option do			
	  local button = g_ui.createWidget('OptionButton', buttonHolder)
	  button:setText(option[i])			  
	  button.onClick = function() g_game.talkChannel(MessageModes.NpcTo, MessageModes.NpcTo, option[i]) end
	end
	
	buttonHolder:setHeight(#option > 6 and 48 or 25)
  end
    	
  openDialog()
end
