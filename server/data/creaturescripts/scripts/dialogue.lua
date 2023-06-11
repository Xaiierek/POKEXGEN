player_choices = {}
defaultButtons = {{id = 0x00, text = "Select", enter = true, escape = false}, {id = 0x01, text = "End", enter = false, escape = true}}

function Player:getChoiceText(choice_id)
if player_choices and player_choices[self:getId()] then
return player_choices[self:getId()][choice_id].text
else
return false
end
end

function Player:createDialogueWindowWithButtons(modalWindowId, headerText, bodyText, buttonTable, choiceTable, sendToPlayer, priority)
local var = ModalWindow(modalWindowId, headerText, bodyText)
for i = 1, #buttonTable do
var:addButton(buttonTable[i].id, buttonTable[i].text)
if buttonTable[i].enter then
var:setDefaultEnterButton(buttonTable[i].id)
end
if buttonTable[i].escape then
var:setDefaultEscapeButton(buttonTable[i].id)
end
end
player_choices[self:getId()] = choiceTable
for i = 0, #choiceTable do
if choiceTable[i] ~= nil and (choiceTable[i].storage == false or self:getStorageValue(choiceTable[i].storage[1]) == choiceTable[i].storage[2]) then
var:addChoice(i, choiceTable[i].text)
end
end
if not priority then
var:setPriority(false)
end
if sendToPlayer then
var:sendToPlayer(self)
end
end

function onModalWindow(player, modalWindowId, buttonId, choiceId) -- be careful here if you have other modalwindow scripts
if buttonId == 0x00 then
player:say(player:getChoiceText(choiceId),TALKTYPE_SAY)
elseif buttonId == 0x01 then
player:say("Good Bye.",TALKTYPE_SAY)
end
return true
end