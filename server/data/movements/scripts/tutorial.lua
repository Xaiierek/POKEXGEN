local tutorialPosition = Position(1033, 1045, 7)
local effect = CONST_ME_TUTORIALSQUARE

function onStepIn(creature, item, position, fromPosition)
  local player = creature:getPlayer()
  if not player then
    return true
  end

  if position == tutorialPosition then
    player:getPosition():sendMagicEffect(effect)
  end

  return true
end