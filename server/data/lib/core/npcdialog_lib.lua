local OpcodeDialog = 80
local Actions = {
  create = 1,
  close = 2
}

function Player.doSendDialogNpc(self, npc, msg, opc, items)
  if ( not opc ) then
    opc = {}
  end
  local items_data = {}
  for _, item_id in ipairs(items or {}) do
    local itemType = ItemType(item_id)
    local clientId = itemType:getClientId()
    table.insert(items_data, clientId)
  end
  self:sendExtendedOpcode(OpcodeDialog, json.encode({ action = "create", data = { npcId = npc, message = msg, options = opc, items = items_data } })) 
end


function Player.doSendDialogNpcClose(self)
  self:sendExtendedOpcode(OpcodeDialog, json.encode({ action = "close" }))
end
