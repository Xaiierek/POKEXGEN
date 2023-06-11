local tutorialArrows = {
    [1] = {position = Position(1032, 1047, 7), text = "Witaj w tutorialu! Przejdź na wschód."},
    [2] = {position = Position(102, 100, 7), text = "Zbierz przedmioty z ziemi, używając Ctrl+Klik."},
    [3] = {position = Position(102, 102, 7), text = "Użyj przedmiotów na sobie, aby je założyć. Kliknij prawym przyciskiem myszy i wybierz 'Use'."},
}

function onThink(cid, interval, lastExecution)
    local player = Player(cid)
    if not player then
        return true
    end

    for _, tutorial in ipairs(tutorialArrows) do
        if player:getPosition() == tutorial.position then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, tutorial.text)
            player:sendArrow(tutorial.position, ARROW_DIRECTION_EAST) -- ARROW_DIRECTION może być zmienione na odpowiednią wartość
        end
    end

    return true
end