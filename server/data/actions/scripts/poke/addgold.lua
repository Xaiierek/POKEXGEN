local itemID = 1949
local money = 40
local words = "chuj" 
local slots = false

function onUse(cid, item, itemEx, fromPosition, toPosition, player)
    player = Player(cid)
	if player.getEmptySlots(cid, slots) then
        if item.itemid == itemID then
            doPlayerAddMoney(cid, money)
			doPlayerSendTextMessage(cid, words)
            doSendMagicEffect(getCreaturePosition(cid), CONST_ME_GIFT_WRAPS)
            doRemoveItem(item.uid)
		else
			doPlayerSendCancel(cid, "Sorry, you dont have enough space in your container")
            doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POOFS)
        end
	end
    return true
end



