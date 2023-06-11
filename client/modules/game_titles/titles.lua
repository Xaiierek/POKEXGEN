local playerTitles = {["GOD Pota"] = {title = "[DEV]", color = "#FFFFFF"}}
local titleFont = "bebasek"

function init()
  connect(Creature, {
    onAppear = updateTitle,
  })  
end

function terminate()
  disconnect(Creature, {
    onAppear = updateTitle,
  })  
end

function updateTitle(creature)
    local name = creature:getName()
    if creature:isPlayer() then
        if playerTitles[name] then
		local title = playerTitles[name].title
		local titleColor = playerTitles[name].color
		local newName = title .. " " .. name
			--creature:setTitle(playerTitles[name].title, titleFont, playerTitles[name].color)
			creature:setName(newName)
			
        end
    end
end