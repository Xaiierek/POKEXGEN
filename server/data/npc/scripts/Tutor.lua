local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local function greetCallback(cid)
    local player = Player(cid)
    if player then
        player:registerEvent("TutorialWindow")
    end
    npcHandler:setMessage(MESSAGE_GREET, "Witaj, podróżniku! Chciałbyś dowiedzieć się więcej o podstawach gry?")
    return true
end

local function onTutorial(cid, message, keywords, parameters, node)
    local player = Player(cid)
    if not player then
        return false
    end

    local tutorialWindowOpcode = 101
    local npcName = "Tutor"
    local text = "Witaj w naszym tutorialu! W tym okienku otrzymasz informacje na temat podstaw gry. Aby poruszać się, użyj klawiszy strzałek na klawiaturze lub kliknij prawym przyciskiem myszy w wybrane miejsce na mapie. W razie potrzeby użyj lewego przycisku myszy, aby wykonać różne akcje, takie jak otwieranie drzwi czy kontenerów. Powodzenia!"
    local buffer = npcName .. ";" .. text
    player:sendExtendedOpcode(tutorialWindowOpcode, buffer)

    return true
end

local tutorialNode = keywordHandler:addKeyword({'tak'}, onTutorial, {npcHandler = npcHandler})
tutorialNode:addChildKeywordNode(KeywordNode:new({'nie'}, StdModule.say, {npcHandler = npcHandler, text = 'Dobrze, gdybyś zmienił zdanie, wróć tutaj!'}))

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())