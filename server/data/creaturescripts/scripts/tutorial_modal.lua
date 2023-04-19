function onModalWindow(player, modalWindowId, buttonId, choiceId)
    local tutorialWindow = 1000 -- Ustal unikalne ID dla okna tutorialu

    if modalWindowId == tutorialWindow then
        if buttonId == 1 then -- Gracz kliknął przycisk "Dalej"
            -- Tutaj możesz dodać kolejne instrukcje, np. otwarcie kolejnego okna z instrukcją
            -- lub przeniesienie gracza do kolejnej części tutorialu
        elseif buttonId == 2 then -- Gracz kliknął przycisk "Zamknij"
            player:unregisterEvent("tutorialModal") -- Usuń zdarzenie
        end
    end
end

function onLogin(player)
    local tutorialWindow = 1000
    local window = ModalWindow(tutorialWindow, "Tutorial", "Witaj w naszym tutorialu!")

    window:addButton(1, "Dalej")
    window:addButton(2, "Zamknij")
    window:sendToPlayer(player)

    player:registerEvent("tutorialModal")
    return true
end