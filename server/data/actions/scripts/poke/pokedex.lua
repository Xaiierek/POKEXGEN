local multiplier = 5 -- how many times more exp than killing the monster the player will get when using dex on it for the first time
local pokedexId = 2263
local opcodePokedexImage = 198  -- Replace with the actual opcode number you registered in the TFS source code

--function Monster.getSummonStatus(self)
--	local output = "Status of " .. self:getName()	
--	if self:isPokemon() then
--		local master = self:getMaster()
--		--output = output ..  " that belongs to " .. master:getName() 
--	end
--
--	local monsterType = MonsterType(self:getName())
--	local race = monsterType:getRaceName()
--	local race2 = monsterType:getRace2Name()
--	local raceName = race
--	if race2 ~= "none" then
--		raceName = raceName .. "/" .. race2
--	end
--	output = output .. "\nRace: \t" .. raceName .. "\nLevel: \t" .. self:getLevel() .. "\nBoost: \t+" .. self:getBoost() .. "\nLove: \t" .. self:getLove()
--	output = output .. "\n\nStats:\n"
--	output = output .. "\nHealth: \t" .. self:getTotalHealth() 
--			.. "\nAttack: \t" .. self:getTotalMeleeAttack() 
--			.. "\nMagic Attack: \t" .. self:getTotalMagicAttack() 
--			.. "\nMagic Defense: \t" .. self:getTotalMagicDefense() 
--			.. "\nArmor: \t" .. self:getTotalDefense() 
--			.. "\nSpeed: \t" .. self:getTotalSpeed()
--	local moveList = monsterType:getMoveList()
--	if #moveList >= 1 then
--		output = output .. "\n\nMoves:" .. "\n"
--		for i = 1, #moveList do
--			local move = moveList[i]
--			if move then
--				output = output .. "\n" .. moveWords[i] .. " - \t" .. move.name .. ". Cooldown: \t" .. move.speed / 1000 .. " seconds."
--			else
--				break
--			end
--		end
--	end
--	local evolutionList = monsterType:getEvolutionList()
--	if #evolutionList >= 1 then
--		output = output .. "\n\nEvolutions:" .. "\n"
--		for i = 1, #evolutionList do
--			local evolution = evolutionList[i]
--			local evolutionName = evolution.name
--			if evolutionName ~= "" then
--				output = output .. "\nEvolves to " .. evolutionName .. " at level " .. evolution.level .. " with probability of " .. evolution.chance .. " percent "
--				if evolution.itemName then
--					output = output .. "or by using " .. evolution.count .. " " .. evolution.itemName
--				end
--			end
--		end
--	else
--		output = output .. "\n\nThis monster does not evolve."
--	end
--	if monsterType:isFlyable() > 0 or monsterType:isRideable() > 0 or monsterType:isSurfable() > 0 or monsterType:canTeleport() > 0 or race == "rock" or race2 == "rock" or race == "grass" or race2 == "grass" or race == "ground" or race2 == "ground" or race == "fighting" or race2 == "fighting" or self:getName() == "Ditto" or self:getName() == "Shiny Ditto" then
--		output = output .. "\n\nHabilities:" .. "\n"
--		if monsterType:isFlyable() > 0 then 
--			output = output .. "\nFly"
--		end
--		if monsterType:isRideable() > 0 then 
--			output = output .. "\nRide"
--		end
--		if monsterType:isSurfable() > 0 then 
--			output = output .. "\nSurf"
--		end
--		if monsterType:canTeleport() > 0 then 
--			output = output .. "\nTeleport"
--		end
--		if monsterType:getRaceName() == "rock" or monsterType:getRace2Name() == "rock" or monsterType:getRaceName() == "fighting" or monsterType:getRace2Name() == "fighting" then 
--			output = output .. "\nRock Smash"
--		end
--		if monsterType:getRaceName() == "grass" or monsterType:getRace2Name() == "grass" then 
--			output = output .. "\nCut"
--		end
--		if monsterType:getRaceName() == "ground" or monsterType:getRace2Name() == "ground" then 
--			output = output .. "\nDig"
--		end
--		if self:getName() == "Ditto" or self:getName() == "Shiny Ditto" then 
--			output = output .. "\nTransform"
--		end
--	else
--		output = output .. "\n\nThis monster has no habilities."
--	end
--
--	return output
--end



function Monster.getRaceInfo(self)
    local monsterType = MonsterType(self:getName())
    local race = monsterType:getRaceName()
    local race2 = monsterType:getRace2Name()
    local raceName = race
    if race2 ~= "" then
        raceName = raceName .. "/" .. race2
    end
    return self:getName() .. " (" .. raceName .. ")"
end

function Monster.getStats(self)
    local statsText = string.format("Health: %d\nAttack: %d\nMagic Attack: %d\nMagic Defense: %d\nArmor: %d\nSpeed: %d",
                                     self:getTotalHealth(), self:getTotalMeleeAttack(),
                                     self:getTotalMagicAttack(), self:getTotalMagicDefense(),
                                     self:getTotalDefense(), self:getTotalSpeed())
    return statsText
end

function Monster.getMoveList(self)
    local monsterType = MonsterType(self:getName())
    local moveList = monsterType:getMoveList()
    local moveListText = ""

    if #moveList >= 1 then
        for i = 1, #moveList do
            local move = moveList[i]
            if move then
                moveListText = moveListText .. string.format("%s - %s. Cooldown: %.2f seconds. ", moveWords[i], move.name, move.speed / 1000)
            else
                break
            end
        end
    end

    return moveListText
end

function Monster.getEvolutionList(self)
    local monsterType = MonsterType(self:getName())
    local evolutionList = monsterType:getEvolutionList()
    local evolutionListText = ""

    if #evolutionList >= 1 then
        for i = 1, #evolutionList do
            local evolution = evolutionList[i]
            local evolutionName = evolution.name
            if evolutionName ~= "" then
                evolutionListText = evolutionListText .. string.format("\nEvolves to %s at level %d with probability of %d percent ", evolutionName, evolution.level, evolution.chance)
                if evolution.itemName then
                    evolutionListText = evolutionListText .. string.format("or by using %d %s", evolution.count, evolution.itemName)
                end
            end
        end
    else
        evolutionListText = "This monster does not evolve."
    end

    return evolutionListText
end

function Monster.getHabilities(self)
    local monsterType = MonsterType(self:getName())
    local habilities = {}
    if monsterType:isFlyable() > 0 then 
        table.insert(habilities, "Fly")
    end
    if monsterType:isRideable() > 0 then 
        table.insert(habilities, "Ride")
    end
    if monsterType:isSurfable() > 0 then 
        table.insert(habilities, "Surf")
    end
    if monsterType:canTeleport() > 0 then 
        table.insert(habilities, "Teleport")
    end
    if monsterType:getRaceName() == "rock" or monsterType:getRace2Name() == "rock" or monsterType:getRaceName() == "fighting" or monsterType:getRace2Name() == "fighting" then 
        table.insert(habilities, "Rock Smash")
    end
    if monsterType:getRaceName() == "grass" or monsterType:getRace2Name() == "grass" then 
        table.insert(habilities, "Cut")
    end
    if monsterType:getRaceName() == "ground" or monsterType:getRace2Name() == "ground" then 
        table.insert(habilities, "Dig")
    end
    if self:getName() == "Ditto" or self:getName() == "Shiny Ditto" then 
        table.insert(habilities, "Transform")
    end

    return table.concat(habilities, "\n")
end

function Player.getPokedexStatus(self, firstStorage)
	local output = "Status of " .. self:getName() .. ".\n\n[id]Pokemon Tries/Catch-Shiny Tries/Catch\n\n"
	for i,v in pairs(monstersTable) do
		if self:getStorageValue(firstStorage + i) ~= -1 then
			if i <= 1000 or i > 3000 then
				if monstersTable[i] then
					output = output .. "[" .. i .. "]" .. monstersTable[i] 
					if self:getStorageValue(baseStorageTries + i) > 0 then
						output = output .. " " .. self:getStorageValue(baseStorageTries + i) 
					else
						output = output .. " 0"
					end
					if self:getStorageValue(baseStorageCatches + i) > 0 then
						output = output .. "/" .. self:getStorageValue(baseStorageCatches + i) 
					else
						output = output .. "/0"
					end
					if i <= 1000 then
						if self:getStorageValue(baseStorageTries + 2000 + i) > 0 then
							output = output .. "-" .. self:getStorageValue(baseStorageTries + 2000 + i)
						else
							output = output .. "-0"
						end
						if self:getStorageValue(baseStorageCatches + 2000 + i) > 0 then
							output = output .. "/" .. self:getStorageValue(baseStorageCatches + 2000 + i)
						else
							output = output .. "/0"
						end
					end
					output = output .. "\n"
				end
			end			
		end
	end
	return output
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not target then return false end

	if type(target) ~= "userdata" then
		return true
	end

	if target ~= item and target:isCreature() ~= true then return false end

	if target:isCreature() then -- check if it is on dex or add to dex
		if not target:isMonster() then			
			local text = player:getPokedexStatus(baseStorageDex)
			if #text >= 1000 then
				print("Sending ExtendedOpcode: " .. pokedexId)
				player:sendExtendedOpcode(198, pokedexId, string.sub(text, math.floor(#text/2) + 1 , #text))
				player:sendExtendedOpcode(198, pokedexId, string.sub(text, 1 , math.floor(#text/2)))
			else
				--player:showTextDialog(pokedexId, text)
				player:sendExtendedOpcode(198, pokedexId, text)
			end
			return true 
		end
		local monsterNumber = MonsterType(target:getName()):dexEntry() --target:getMonsterNumber() 
		if monsterNumber == 0 then
			print("WARNING: Monster " .. target:getName() .. " does not have info entry.")
			player:sendCancelMessage("Sorry, not possible. This problem was reported.")			
			return true
		end
		local storage = baseStorageDex + monsterNumber
		if player:getStorageValue(storage) == -1 then -- add to dex	
			local givenExp = target:getExperience() * configManager.getNumber(configKeys.RATE_EXPERIENCE) * multiplier
			player:setStorageValue(storage, 0)
			--getPlayerPosition(player):sendMagicEffect(329)
			player:addExperience(givenExp, true)
		else-- open status of monster
			getPlayerPosition(player):sendMagicEffect(300)
			local monsterType = MonsterType(target:getName())
			local portraitId = monsterType:portraitId()
			local portraitItemType = ItemType(portraitId)
			local name = target:getName()
			local moveList = monsterType:getMoveList()
			local moveListStr = ""
			for i = 1, #moveList do
				local move = moveList[i]
				if move then
					if i ~= 1 then
						moveListStr = moveListStr .. ";"
					end
					moveListStr = moveListStr .. string.format("%s:%.2f", move.name, move.speed / 1000)
				else
					break
				end
			end
			if portraitId == 0 or portraitItemType:getId() == 0 then portraitId = pokedexId end
			local dex_information = string.format("dex_data|%s|%s|%s|%s", monsterType:getName(), monsterType:getRaceName(), monsterType:getRace2Name(), moveListStr)
			print("Sending ExtendedOpcode: " .. dex_information)
			player:sendExtendedOpcode(198, dex_information .. "|")
		end
	end
	return true
end
