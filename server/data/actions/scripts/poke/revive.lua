function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not target then
		return false
	end

	if type(target) ~= "userdata" then
		return true
	end

	if target:isCreature() then
		return false
	end

	if target:isItem() and not target:isPokeball() then
		player:sendCancelMessage("Sorry, not possible. You can only use on pokeballs.")
		return true
	end

	local summonHealth = target:getSpecialAttribute("pokeHealth")
	local summonName = target:getSpecialAttribute("pokeName")

	if summonHealth > 0 and summonHealth < 0 then
		player:sendCancelMessage("Sorry, not possible. You can only use on fainted summons.")
		return true
	end

	if player:isDuelingWithNpc() then
		player:sendCancelMessage("Sorry, not possible while in duels.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end

	if player:isOnLeague() then
		if not player:canUseReviveOnLeague() then
			player:sendCancelMessage("Sorry, you can not use revive anymore.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return true
		end
	end
	
	local summon = player:getSummons()[1]
	if summon and summon:getName() == summonName then
		player:sendCancelMessage("You cannot use revive while your Pokemon is summoned.")
		return true
	end

	-- reset all cooldowns
	for i = 1, 12 do 
		local move = "cd" .. i
		target:setSpecialAttribute(move, 0)
	end

	target:setSpecialAttribute("pokeHealth", 1000000)
	local ballKey = getBallKey(target:getId())
	local ballId = target:getId()
	local isBallBeingUsed = target:getSpecialAttribute("isBeingUsed")
	if ballId == balls[ballKey].usedOff and isBallBeingUsed ~= 1 then
		target:setSpecialAttribute("isBeingUsed", 0)
		target:transform(balls[ballKey].usedOn)
	end
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	item:remove(1)
	return true
end
