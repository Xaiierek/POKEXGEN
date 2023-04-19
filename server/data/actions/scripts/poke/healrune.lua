local healingPokemon = {}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not target then
        return false
    end

    if type(target) ~= "userdata" then
        return true
    end

    if not target:isCreature() then
        return true
    end

    if not (target:isPokemon() or target:isPlayer()) then
        return false
    end

    if target:isPokemon() and target:getMaster():isDuelingWithNpc() then
        player:sendCancelMessage("Sorry, not possible while in duels.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    if player:isOnLeague() then
        if not player:canUsePotionOnLeague() then
            player:sendCancelMessage("Sorry, you can not use potion anymore.")
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return true
        end
    end

    local maxHealth = target:getMaxHealth()
    local heal = math.floor(maxHealth / 2)
    if player:getVocation():getName() == "Healer" then
        heal = math.floor(heal * healerHealBuff)
    end

    local healPerInterval = math.floor(heal / 10)
    local targetId = target:getId()

    local function gradualHeal(initialHealth, totalHeal, healed, lastHealth)
        local target = Creature(targetId)
        if not target or target:getHealth() == maxHealth or healingPokemon[targetId] ~= initialHealth then
            healingPokemon[targetId] = nil
            return
        end

        local currentHealth = target:getHealth()

        if lastHealth and currentHealth < lastHealth then
            -- Healing stops if Pokemon takes damage.
            healingPokemon[targetId] = nil
            return
        end

        local newHealth = currentHealth + healPerInterval
        local adjustedHeal = healPerInterval

        if newHealth > maxHealth then
            adjustedHeal = maxHealth - currentHealth
        end

        target:addHealth(adjustedHeal)
        target:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
        addEvent(gradualHeal, 500, initialHealth, totalHeal, healed + adjustedHeal, currentHealth)
    end

    if not healingPokemon[targetId] then
        local initialHealth = target:getHealth()
        healingPokemon[targetId] = initialHealth
        gradualHeal(initialHealth, heal, 0, nil)
    end

    item:remove(1)
    return true
end