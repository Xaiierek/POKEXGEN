local storageCathemAll = quests.cathemAll.prizes[1].uid
local storageIndigoLeague = quests.indigoLeague.prizes[1].uid
local storageOakRequest = quests.oakRequest.prizes[1].uid
local storageCeruleanCave = quests.ceruleanCave.prizes[1].uid
local storageCeruleanCave2 = quests.ceruleanCave.prizes[2].uid
local storageCeruleanCave3 = quests.ceruleanCave.prizes[3].uid
local storageThePokemaster = quests.thePokemaster.prizes[1].uid
local storageRedRequest = quests.redRequest.prizes[1].uid
local legendaryIndex = {144, 145, 146, 150, 151, 243, 244, 245, 249, 250, 251, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386}
local item1 = 26735 
local item2 = 26734 
local item3 = 26733 
local itemCount = 1 
local questStorage = 80000 
local message = ""

	local name =
	{
		"Bulbasaur", "Squirtle", "Charmander"
	}


local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end



function greetCallback(cid)
  local player = Player(cid)
  if player:getStorageValue(questStorage) == -1 then
	player:doSendDialogNpc(Npc():getId(), "Hello, what do you want?", "Help&Cancel")
  elseif player:getStorageValue(questStorage) == 1 then
  	player:doSendDialogNpc(Npc():getId(), "Do you have these items?", "Yes&Cancel", {item1, item2, item3})
  elseif player:getStorageValue(questStorage) == 2 then
  	player:doSendDialogNpc(Npc():getId(), "You have already completed this quest.", "Cancel")
  end
  return true
end

function creatureSayCallback(cid, type, msg)
  local player = Player(cid)
  if not npcHandler:isFocused(cid) then
    return false
  end

	if msgcontains(msg:lower(), "help") and player:getStorageValue(questStorage) == -1 then
		message = "Can you get some items for me? I will reward you accordingly.Can you get some items for me? I will reward you accordingly.Can you get some items for me? I will reward you accordingly.Can you get some items for me? I will reward you accordingly.Can you get some items for me? I will reward you accordingly."
		player:doSendDialogNpc(Npc():getId(), message, "Yes&Cancel")
	elseif msgcontains(msg:lower(), 'yes') and player:getStorageValue(questStorage) == 1 then
		if player:getItemCount(item1) >= itemCount and player:getItemCount(item2) >= itemCount and player:getItemCount(item3) >= itemCount then
			player:removeItem(item1, itemCount)
			player:removeItem(item2, itemCount)
			player:removeItem(item3, itemCount)
			player:addExperience(250000, true)
			player:addItem(2160, 15)
			player:setStorageValue(questStorage, 2)
			message = "Good Job! You did it!"
			player:doSendDialogNpc(Npc():getId(), message, "Cancel")
		else
			
			player:doSendDialogNpc(Npc():getId(), "You don't have all the required items.", "Cancel")
		end
	elseif msgcontains(msg:lower(), "yes") and player:getStorageValue(questStorage) == -1 then
		player:setStorageValue(questStorage, 1)
		message = "I would like you to bring me some items needed for research on Pokemon evolution."
		player:doSendDialogNpc(Npc():getId(), message, "Ok&Cancel", {item1, item2, item3})

	end
	
	if msgcontains(msg:lower(), "cancel") or msgcontains(msg:lower(), "ok") then
		message = "See ya!"
		player:doSendDialogNpcClose(Npc():getId(), message)
		npcHandler:unGreet(cid)
	end
	
	return true
end




npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())
