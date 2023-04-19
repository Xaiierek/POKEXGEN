local useWorms = false
local maxSkill = 100
local fishingPlayers = {}

	local monsterTrash = {"Magikarp"}
	local monsterVeryCommon = {"Magikarp", "Horsea", "Goldeen", "Krabby", "Poliwag", "Staryu"}
	local monsterCommon = {"Magikarp", "Horsea", "Goldeen", "Tentacool", "Krabby", "Poliwag", "Staryu", "Psyduck"}
	local monsterMildRare = {"Seadra", "Seaking", "Kingler"}
	local monsterRare = {"Magikarp", "Horsea", "Goldeen", "Tentacool", "Krabby", "Poliwag", "Staryu", "Psyduck", "Seadra", "Seaking", "Kingler", "Poliwhirl", "Starmie"}
	local monsterVeryRare = {"Magikarp", "Horsea", "Goldeen", "Tentacool", "Krabby", "Poliwag", "Staryu", "Psyduck", "Seadra", "Seaking", "Kingler", "Poliwhirl", "Starmie", "Golduck", "Tentacruel"}
	local monsterUltraRare = {"Magikarp", "Horsea", "Goldeen", "Tentacool", "Krabby", "Poliwag", "Staryu", "Psyduck", "Seadra", "Seaking", "Kingler", "Poliwhirl", "Starmie", "Golduck", "Tentacruel", "Kingdra", "Gyarados"}
		


function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local targetId = target:getId()

    if fishingPlayers[player:getId()] then
        player:sendCancelMessage("You are already using a fishing rod.")
        return true
    end

    fishingPlayers[player:getId()] = {
        startPosition = player:getPosition(),
        fishing = true
    }

    local function fishPokemon()
        if not fishingPlayers[player:getId()].fishing then
            fishingPlayers[player:getId()] = nil
            return false
        end

        if fishingPlayers[player:getId()].startPosition ~= player:getPosition() then
            fishingPlayers[player:getId()] = nil
            player:sendCancelMessage("You moved! Fishing action was cancelled.")
            return false
        end

        local summons = player:getSummons()
        if #summons <= 0 then
            player:sendCancelMessage("Sorry, not possible. You need a Pokemon to be able to fish.")
            fishingPlayers[player:getId()] = nil
            return false
        end

        local summonTile = summons[1]:getTile()
        if summonTile:getHouse() or summonTile:hasFlag(TILESTATE_PROTECTIONZONE) then
            player:sendCancelMessage("Sorry, not possible. Your summon must be outside a protection zone.")
            fishingPlayers[player:getId()] = nil
            return false
        end

        if targetId == 493 or targetId == 15402 then
            return true
        end

        if targetId == 10499 then
            local owner = target:getAttribute(ITEM_ATTRIBUTE_CORPSEOWNER)
            if owner ~= 0 and owner ~= player:getId() then
                player:sendTextMessage(MESSAGE_STATUS_SMALL, "You are not the owner.")
                return true
            end

            toPosition:sendMagicEffect(CONST_ME_WATERSPLASH)
            target:remove()
        end

        if targetId ~= 7236 then
            toPosition:sendMagicEffect(CONST_ME_LOSEENERGY)
        end

        if player:getEffectiveSkillLevel(SKILL_FISHING) <= maxSkill then
            player:addSkillTries(SKILL_FISHING, 1)
        end
		    local position = player:getPosition()

    if math.random(1, 100) <= math.min(math.max(10 + (player:getEffectiveSkillLevel(SKILL_FISHING) - 10) * 0.597, 10), 50) then
	
        local name = "Magikarp"

        if player:getSkillLevel(SKILL_FISHING) < 8 then
            name = monsterTrash[math.random(#monsterTrash)]
        elseif player:getSkillLevel(SKILL_FISHING) >= 8 and player:getSkillLevel(SKILL_FISHING) < 20 then
            name = monsterVeryCommon[math.random(#monsterVeryCommon)]
        elseif player:getSkillLevel(SKILL_FISHING) >= 20 and player:getSkillLevel(SKILL_FISHING) < 30 then
            name = monsterCommon[math.random(#monsterCommon)]
        elseif player:getSkillLevel(SKILL_FISHING) >= 30 and player:getSkillLevel(SKILL_FISHING) < 45 then
            name = monsterMildRare[math.random(#monsterMildRare)]
        elseif player:getSkillLevel(SKILL_FISHING) >= 45 and player:getSkillLevel(SKILL_FISHING) < 60 then
            name = monsterRare[math.random(#monsterRare)]
        elseif player:getSkillLevel(SKILL_FISHING) >= 60 and player:getSkillLevel(SKILL_FISHING) < 75 then
            name = monsterVeryRare[math.random(#monsterVeryRare)]
        elseif player:getSkillLevel(SKILL_FISHING) >= 75 then
            name = monsterUltraRare[math.random(#monsterUltraRare)]
        end

        local monsterType = MonsterType(name)

        if math.random(1, 100) <= shinyChance then
            if monsterType:hasShiny() > 0 then
					name = "Shiny " .. name
					local shinyMonsterType = MonsterType(name)
					if not shinyMonsterType then
						print("WARNING! " .. name .. " not found for respawn.")
						return false
					end
				end
			end
			
			local numberOfMonsters = math.random(1, 3)
			
			for i = 1, numberOfMonsters do
				Game.createMonster(name, player:getClosestFreePosition(player:getPosition()))
			end
			
			if targetId == 15401 then
					target:transform(targetId + 1)
					target:decay()
				elseif targetId == 7236 then
					target:transform(targetId + 1)
					target:decay()
			end
			
			-- Usuwanie informacji o graczu z tabeli
			fishingPlayers[player:getId()] = nil
			return true -- Gracz złowił pokemona,
			else
			-- Gracz nie złowił pokemona, kontynuujemy próby
			local fishingDelay = 1000 -- opóźnienie w milisekundach
			addEvent(fishPokemon, fishingDelay)
			return false
	end
	end
    fishPokemon()
    return true
end